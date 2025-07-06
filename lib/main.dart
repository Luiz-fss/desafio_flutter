import 'package:desafio_flutter/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(),
          lazy: false,

        ),
      ],
      child: MaterialApp(
        title: 'Desafio Flutter',
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
      ),
    );
  }
}
