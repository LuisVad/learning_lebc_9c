import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  // Función para validar el correo electrónico
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su correo electrónico';
    }
    final RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  // Función para validar la contraseña
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'La contraseña debe contener al menos un número';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'La contraseña debe contener al menos un carácter especial';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: const Color.fromARGB(255, 26, 207, 180),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/stop.png', width: 200, height: 200),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                //icon: Icon(Icons.person),
                hintText: 'Correo Electrónico',
                label: Text('Correo Electrónico'),
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              validator: _validateEmail, // Validación de correo
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Contraseña',
                  label: const Text('Contraseña'),
                  labelStyle: const TextStyle(color: Colors.black),
                  icon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(_isObscure
                          ? Icons.visibility
                          : Icons.visibility_off))),
              controller: _password,
              obscureText: _isObscure,
              validator: _validatePassword, // Validación de contraseña
            ),
            const SizedBox(height: 16),
            SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print('Email: ${_email.text}');
                      print('Password: ${_password.text}');
                      try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                      }
                    }
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  child: const Text('Iniciar Sesión'),
                ))
          ]),
          )
        ));
  }
}
