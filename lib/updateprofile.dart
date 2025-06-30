import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Mise à jour profil"),
      ),
      body: SingleChildScrollView(
        // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Mettre à jour le profil",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTextField("Entrez votre nom complet"),
              _buildTextField("Entrez votre e-mail"),
              _buildCityDropdown(),
              _buildTextField("Entrez votre numéro de Tél"),
              _buildPhotoUploadButton(),
              _buildTextField("Entrez le nouveau mot de passe",
                  obscureText: true),
              _buildTextField("Confirmer le nouveau mot de passe",
                  obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Enregistrer les modifications",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
        textAlign: TextAlign.center, // Center the text inside the input field
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white, // Set background color to white
        ),
      ),
    );
  }

  Widget _buildCityDropdown() {
    // List of Tunisian cities
    final List<String> cities = [
      "Tunis",
      "Sfax",
      "Sousse",
      "Kairouan",
      "Bizerte",
      "Gabès",
      "Ariana",
      "Gafsa",
      "Monastir",
      "Ben Arous",
      "Nabeul",
      "Kasserine",
      "Tozeur",
      "Medenine",
      "Mahdia",
      "Zaghouan",
      "Siliana",
      "Jendouba",
      "Kef",
      "Tataouine",
      "Manouba",
      "Beja",
      "Kebili"
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: "Entrez votre ville",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white, // Set background color to white
        ),
        items: cities.map((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          );
        }).toList(),
        onChanged: (String? value) {
          // Handle city selection
        },
      ),
    );
  }

  Widget _buildPhotoUploadButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: () {
          // Handle photo upload
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
              color: const Color.fromARGB(
                  255, 89, 89, 89)), // Set border color to gray
          backgroundColor: Colors.white, // Set background color to white
        ),
        child: const SizedBox(
          height: 50, // Increase the height of the box
          child: Center(
            child: Text(
              "Entrez votre photo de profil",
              style: TextStyle(color: Color.fromARGB(255, 118, 118, 118)),
            ),
          ),
        ),
      ),
    );
  }
}
