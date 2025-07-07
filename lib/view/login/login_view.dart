import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_model.dart';
import 'package:desafio_flutter/view/components/inputs/custom_text_field.dart';
import 'package:desafio_flutter/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _textEditingControllerCpf = TextEditingController();
  TextEditingController _textEditingControllerName = TextEditingController();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LoginCubit, LoginCubitModel>(
      bloc: BlocProvider.of<LoginCubit>(context),
      builder: (context, state) {
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
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width:kIsWeb ? size.width * 0.3 : size.width * 0.85,
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
                                      context
                                          .read<LoginCubit>()
                                          .setIsLogin(true);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
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
                                        const SizedBox(height: 4),
                                        Visibility(
                                          visible: state.isLogin,
                                          child: Container(
                                            height: 2,
                                            width: 40,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  GestureDetector(
                                    onTap: () {
                                      context
                                          .read<LoginCubit>()
                                          .setIsLogin(false);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
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
                                        const SizedBox(height: 4),
                                        Visibility(
                                          visible: !state.isLogin,
                                          child: Container(
                                            height: 2,
                                            width: 60,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              ..._buildFields(state.isLogin),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Checkbox(
                                    value: state.rememberMe,
                                    onChanged: (value) {
                                      context
                                          .read<LoginCubit>()
                                          .toggleRememberMe();
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
                        Transform.translate(
                          offset: const Offset(0, -30),
                          child: GestureDetector(
                            onTap: () async{
                              bool login = context.read<LoginCubit>().state.isLogin;
                              if(login){
                               await _login();
                               return;
                              }
                              await _registerUser();

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
                        const Text(
                          "Acesse através das redes sociais",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.google,
                                size: 40, color: Colors.white),
                            SizedBox(width: 24),
                            FaIcon(FontAwesomeIcons.facebookF,
                                size: 40, color: Colors.white),
                            SizedBox(width: 24),
                            FaIcon(FontAwesomeIcons.twitter,
                                size: 40, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildFields(bool isLogin) {
    if (isLogin) {
      return [
        CustomTextField(
          controller: _textEditingControllerCpf,
          hintText: "CPF",
          obscureText: false,
          keyboardType: TextInputType.number,
          maskText: "###.###.###-##",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _textEditingControllerPassword,
          hintText: "Senha",
          obscureText: true,
          keyboardType: TextInputType.number,
        ),
      ];
    } else {
      return [
        CustomTextField(
          controller: _textEditingControllerName,
          hintText: "Nome",
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _textEditingControllerCpf,
          hintText: "CPF",
          obscureText: false,
          keyboardType: TextInputType.number,
          maskText: "###.###.###-##",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _textEditingControllerEmail,
          hintText: "Email",
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _textEditingControllerPassword,
          hintText: "Senha",
          obscureText: true,
          keyboardType: TextInputType.number,
        ),
      ];
    }
  }

  Future<void> _login() async {
    bool validFields = _validateFieldsForLogin();
    if (validFields) {
      try {
        await context.read<LoginCubit>().login(
          _textEditingControllerCpf.text,
          _textEditingControllerPassword.text,
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        return;
      } catch (e) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Erro ao fazer login"),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } else {
      // Mostra erro de campos inválidos
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Erro"),
          content: const Text("Campos inválidos"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _registerUser()async{
    bool validFiels = _validateFields();
    if(validFiels){
      await context.read<LoginCubit>().registerUser(_textEditingControllerCpf.text,
          _textEditingControllerName.text,
          _textEditingControllerPassword.text,
          _textEditingControllerEmail.text
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeView()));
      return;
    }
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Erro"),
        content: Text("Campos inválidos"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  bool _validateFields(){
    if (_textEditingControllerName.text.isEmpty ||
        _textEditingControllerEmail.text.isEmpty ||
        _textEditingControllerCpf.text.isEmpty ||
        _textEditingControllerPassword.text.isEmpty) {
     return false;
    }
    return true;
  }

  bool _validateFieldsForLogin(){
    if (
        _textEditingControllerCpf.text.isEmpty ||
        _textEditingControllerPassword.text.isEmpty) {
      return false;
    }
    return true;
  }
}
