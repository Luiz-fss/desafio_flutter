import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LoginCubit,LoginCubitModel>(
      bloc: BlocProvider.of<LoginCubit>(context),
      builder: (context,state){
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.85,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.read<LoginCubit>().setIsLogin(true);
                                  },
                                  child: Text(
                                    "Entrar",
                                    style: TextStyle(
                                      fontWeight: state.isLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: state.isLogin
                                          ? Colors.green
                                          : Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                GestureDetector(
                                  onTap: () {
                                    context.read<LoginCubit>().setIsLogin(false);
                                  },
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(
                                      fontWeight: !state.isLogin
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: !state.isLogin
                                          ? Colors.green
                                          : Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 24),

                            TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "CPF",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            TextField(
                              obscureText: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: "Senha",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                Checkbox(
                                  value: state.rememberMe,
                                  onChanged: (value) {
                                    context.read<LoginCubit>().toggleRememberMe();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  activeColor: Colors.green,
                                ),
                                const Text("Lembrar sempre"),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Esqueceu sua senha?",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Botão redondo (sobreposto)
                      Transform.translate(
                        offset: const Offset(0, -30),
                        child: GestureDetector(
                          onTap: () {
                            // ação de login
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 60),

                      // Redes sociais
                      const Text(
                        "Acesse através das redes sociais",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.google, size: 40, color: Colors.white),
                          SizedBox(width: 24),
                          FaIcon(FontAwesomeIcons.facebookF, size: 40, color: Colors.white),
                          SizedBox(width: 24),
                          FaIcon(FontAwesomeIcons.twitter, size: 40, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
