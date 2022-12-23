import 'package:flutter/material.dart';
import 'package:news_fbauth_app/screens/register_screen.dart';
import 'package:news_fbauth_app/services/firebase/auth_service.dart';
import 'package:news_fbauth_app/styles/colors/colors_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    //CORREO ELECTRONICO
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
                        ),
                      ),
                    ),
                    //CONTRASEÑA
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
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          onPressed: () {
                            AuthService().logInUser(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'o inicia sesión con',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthService().sigInWithGoogle();
                      },
                      child: const Image(
                        width: 40,
                        image: AssetImage('assets/images/google-logo.png'),
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
                      '¿Eres Nuevo?',
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
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        'Registrate aqui',
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
