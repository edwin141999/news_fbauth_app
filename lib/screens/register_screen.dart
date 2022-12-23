import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:news_fbauth_app/screens/home_screen.dart';
import 'package:news_fbauth_app/services/firebase/auth_service.dart';
import 'package:news_fbauth_app/styles/colors/colors_view.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.kprimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'WORLD NEWS',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: ColorSelect.ksecondaryBackgroundColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    // NOMBRE
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorSelect.ksecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            onSaved: (value) {},
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Nombre',
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 13,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor ingrese su nombre';
                              }
                              return null;
                            }),
                      ),
                    ),
                    // APELLIDOS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorSelect.ksecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                          controller: lastNameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          onSaved: (value) {},
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Apellidos',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 13,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor ingrese sus apellidos';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorSelect.ksecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (value) {},
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Correo electronico',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 13,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Introduzca un correo valido'
                                  : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorSelect.ksecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (value) {},
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Contraseña',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 13,
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) => password != null &&
                                  password.length < 6
                              ? 'La contraseña debe tener al menos 6 caracteres'
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorSelect.kprimaryButtonColor,
                        ),
                        height: 40,
                        child: OutlinedButton(
                          onPressed: () {
                            AuthService().signInUser(
                              nameController.text.trim(),
                              lastNameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              context,
                            );
                          },
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ya estas registrado?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      child: const Text(
                        'Inicia sesión aqui',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
