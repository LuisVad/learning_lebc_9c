import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_lebc_9c/kernel/widgets/field_password.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Global para el formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Cuenta'),
          backgroundColor: const Color.fromARGB(255, 26, 207, 180),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset('assets/init.jfif', width: 200, height: 200),
            const SizedBox(height: 16),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        //icon: Icon(Icons.email),
                        hintText: 'Correo Electrónico',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      //validator: _validateEmail, // Validación de correo
                    ),
                    const SizedBox(height: 16),
                    TextFieldPassword(controller: _password),
                    const SizedBox(height: 16),
                    TextFieldPassword(
                      controller: _confirmPassword,
                      hintText: 'Confirmar Contraseña',
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //print('Email: ${_email.text}');
                            //print('Password: ${_password.text}');
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text);

                              print(credential.user ?? 'No user');
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
                        child: const Text('Crear Cuenta'),
                      ),
                    )
                  ],
                ))
          ]),
        )));
  }
}
