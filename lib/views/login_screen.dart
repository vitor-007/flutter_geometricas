import 'package:flutter/material.dart';
import 'menu_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: "Usuário:", 
                hintText: "Entre com seu usuário.",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha:", 
                hintText: "Entre com sua senha.",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (userController.text.isNotEmpty && passController.text.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    );
                  }
                },
                child: const Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}