// Implementar login con la validación de datos que se tiene en el archivo services/data.dart

import 'package:flutter/material.dart';
import 'package:parcial3/screens/home.dart';
import '../services/data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController carnetController = TextEditingController();

  void _onLoginPressed() {
    String enteredUsername = usernameController.text;
    String enteredCarnet = carnetController.text;

    // Validar los datos ingresados con los datos almacenados en data.dart
    if (loginData[0] == enteredUsername && loginData[1] == enteredCarnet) {
      // Si las credenciales son correctas, navegar a la pantalla de inicio
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Mostrar un mensaje de error si las credenciales son incorrectas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciales incorrectas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nombre de usuario'),
            ),
            TextField(
              controller: carnetController,
              decoration: InputDecoration(labelText: 'Carné'),
              obscureText: true, // Para ocultar el texto del carné
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLoginPressed,
              child: const Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
