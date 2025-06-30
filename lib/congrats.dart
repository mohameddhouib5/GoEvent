import 'package:flutter/material.dart';
import 'package:go_event/home.dart';

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
      home: const CongratsPage(),
    );
  }
}

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

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
                width: 260, // Increased width
                height: 240, // Slightly taller
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  "https://res.cloudinary.com/dhbqealwn/image/upload/v1741989340/GoEVENT/xrhghil6myttwt79osrr.gif",
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
              const SizedBox(height: 40), // More spacing

              // Congratulatory message
              const Text(
                "Félicitations, vous avez rejoint l'événement !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // Increased spacing
              const Text(
                "Le créateur peut vous appeler et rester en contact avec vous.\nÀ bientôt à l'événement !",
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ), // Bigger button
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Icon(Icons.arrow_back, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
