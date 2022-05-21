import 'package:covid19/cubit/indo_cubit.dart';
import 'package:covid19/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IndoCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Data Covid Indonesia',
        home: HomePage(),
      ),
    );
  }
}
