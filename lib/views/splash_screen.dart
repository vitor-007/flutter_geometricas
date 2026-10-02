import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/cps.png', height: 70),
              const SizedBox(height: 20),
              Image.asset('assets/images/fatec-matao.jpg', height: 70),
              const SizedBox(height: 20),
              Image.asset('assets/images/cst-dsm.png', height: 70),
              const SizedBox(height: 30),
              const Text('Aplicativo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Text('Figuras Geométricas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text('Loading...'),
              const SizedBox(height: 10),
              const CircularProgressIndicator(),
              const SizedBox(height: 30),
              const Text('Nome Aluno 1: Vitor Reina'),
              const Text('Nome Aluno 2: [Nome do Colega]'),
              const Text('Nome Aluno 3: [Nome do Colega]'),
              const SizedBox(height: 10),
              const Text('Versão 1.0'),
            ],
          ),
        ),
      ),
    );
  }
}