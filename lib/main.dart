import 'package:desafio_flutter/firebase_options.dart';
import 'package:desafio_flutter/view/home/home_view.dart';
import 'package:desafio_flutter/view/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }

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
        home: LoginView(),
      ),
    );
  }
}
