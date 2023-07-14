import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_challenge_v2/bloc/adventure_bloc.dart';
import 'package:senior_flutter_challenge_v2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdventureBloc>(create: (context) => AdventureBloc())
      ],
      child: MaterialApp(
        title: 'Hyll Assessment',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
