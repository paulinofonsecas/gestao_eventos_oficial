import 'package:flutter/material.dart';
import 'package:gestao_eventos/presentation/home/bloc/bloc.dart';
import 'package:gestao_eventos/presentation/home/widgets/home_body.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const Scaffold(
        body: HomeView(),
      ),
    );
  }    
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
