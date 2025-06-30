import 'package:flutter/material.dart';
import 'package:go_event/home.dart';
import 'package:go_event/joinedevent.dart';

import 'package:go_event/login.dart';
import 'package:go_event/searchpage.dart';

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
      home: const CongratsPageAdd(),
    );
  }
}

class CongratsPageAdd extends StatelessWidget {
  const CongratsPageAdd({super.key});

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
                width: 460, // Increased width
                height: 400, // Slightly taller
                decoration: BoxDecoration(
                  color: Color.fromARGB(0, 150, 73, 73),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                    "https://ckworld.in/wp-content/uploads/2023/07/02-lottie-tick-01-instant-2-unscreen.gif"),
              ),
              const SizedBox(height: 5), // More spacing

              // Congratulatory message
              const Text(
                "votre evenement a été ajouté avec succès !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12), // Increased spacing
              const Text(
                "restez a jour sur l'application pour suivre les inscriptions",
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
                    horizontal: 70, // Adjust horizontal padding
                    vertical: 20, // Adjust vertical padding
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JoinedEventsPage()),
                  );
                },
                child: const Text(
                  "mes evenements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16), // Space between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // 50% rounded (adjust based on button height)
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50, // Adjust horizontal padding
                    vertical: 20, // Adjust vertical padding
                  ),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  "Trouver un evenement ",
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
