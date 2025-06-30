import 'package:flutter/material.dart';

import 'package:go_event/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CongratsPageUP(),
    );
  }
}

class CongratsPageUP extends StatelessWidget {
  const CongratsPageUP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Wider Image Placeholder
              Container(
                width: 360, // Increased width
                height: 240, // Slightly taller
                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 224, 224, 224),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                    "https://media4.giphy.com/media/dwXkFsvto2CPXqlInl/giphy.gif?cid=6c09b9523rem7c53p5al4srb0x5nlyo45k7d06dldukykvjk&ep=v1_stickers_search&rid=giphy.gif&ct=s"),
              ),
              const SizedBox(height: 40), // More spacing

              // Congratulatory message
              const Text(
                "vous faite maintenant partie de notre communauté !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // Increased spacing
              const Text(
                "quattendez vous ? Connectez vous pour explorer l'application",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 48), // More spacing

              // Larger Square Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // 50% rounded (adjust based on button height)
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100, // Adjust horizontal padding
                    vertical: 20, // Adjust vertical padding
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
