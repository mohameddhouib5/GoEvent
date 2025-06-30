import 'package:flutter/material.dart';

import 'package:go_event/congratssignup.dart';
import 'package:go_event/database_helper.dart';

import 'main.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(); // Password Controller
  String? _selectedCity;
  String? _selectedGender;
  DateTime? _selectedDate;
  bool _termsAccepted = false;

  final List<String> _tunisiaCities = [
    "Tunis",
    "Sfax",
    "Sousse",
    "Gabès",
    "Bizerte",
    "Ariana",
    "Gafsa",
    "Monastir",
    "Kairouan",
    "Kasserine",
    "Médenine",
    "Nabeul",
    "Mahdia",
    "Jendouba",
    "Tozeur",
    "Zaghouan"
  ];

  get margin => null;

  Future<void> _pickProfileImage() async {
    setState(() {});
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Function to show Bottom Sheet for Privacy Policy
  void _showPrivacyPolicy(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full screen
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: const Padding(
            padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  thickness: 2,
                  color: Color.fromARGB(255, 51, 50, 50),
                  indent: 150,
                  endIndent: 150,
                ),
                Text(
                  'Politique de confidentialité',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  "Politique de Sécurité de l'Application GOEVENT",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                    "GOEVENT s'engage à protéger les données et la vie privée de ses utilisateurs. Cette politique de sécurité décrit les mesures prises pour assurer la protection des informations personnelles et garantir une expérience sécurisée.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text(
                  "Collecte et Traitement des Données",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                    "GOEVENT collecte des informations personnelles lors de l'inscription, de la participation à des événements et de l'utilisation de l'application. Ces données sont utilisées pour personnaliser l'expérience de l'utilisateur, améliorer les services et garantir la sécurité de la plateforme.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text(
                  " Accès et Contrôle des Données",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                    "Les utilisateurs peuvent :Accéder à leurs informations personnelles.Modifier ou supprimer leurs données sur demande.Gérer les permissions de localisation et de notifications.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                SizedBox(height: 1),
                Text(
                  "Contact",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Text(
                    "Pour toute question ou préoccupation concernant la politique de sécurité de GOEVENT, veuillez contacter le service clientèle:mohameddhouib741@gmail.com",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to HomePage (or the first page)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WelcomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Placeholder
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromARGB(0, 66, 65, 65),
              ),
              child: Image.network(
                'https://res.cloudinary.com/dhbqealwn/image/upload/v1740332036/jrkc64rugrq0oqdhi7dq.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              "Rejoignez l'événement !",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Remplissez le formulaire et rejoignez-nous !",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Name & Profile Photo Upload
            Row(
              children: [
                Expanded(
                  child: _buildTextField(_nameController, "nom"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: _pickProfileImage,
                    decoration: InputDecoration(
                      hintText: "Photo de profil",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      suffixIcon: const Icon(Icons.upload),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Email & City Selection
            Row(
              children: [
                Expanded(child: _buildTextField(_emailController, " e-mail")),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCity,
                    items: _tunisiaCities.map((String city) {
                      return DropdownMenuItem<String>(
                          value: city, child: Text(city));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                    decoration: _inputDecoration("ville"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Phone Number & Gender Selection
            Row(
              children: [
                Expanded(
                    child: _buildTextField(_phoneController, " numéro de Tél")),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    items: ["Homme", "Femme"].map((String gender) {
                      return DropdownMenuItem<String>(
                          value: gender, child: Text(gender));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    decoration: _inputDecoration(" sexe"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Birthdate Picker
            TextFormField(
              readOnly: true,
              onTap: () => _selectBirthDate(context),
              decoration: _inputDecoration(
                _selectedDate == null
                    ? "Sélectionnez votre date de naissance"
                    : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
              ),
            ),
            const SizedBox(height: 10),

            // Password Field
            _buildTextField(_passwordController, "Entrez votre mot de passe",
                obscureText: true),
            const SizedBox(height: 10),

            // Terms & Conditions
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        _showPrivacyPolicy(context), // Open Privacy Policy
                    child: const Text(
                      "J'accepte les [conditions] et la [politique de confidentialité].",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Signup Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: Colors.indigo.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () async {
                  try {
                    final dbHelper = DatabaseHelper.instance;
                    final email = _emailController.text.trim();

                    // Ensure the database is initialized
                    final db = await dbHelper.database;

                    // Show loading indicator
                    showDialog(
                      context: context,
                      barrierDismissible:
                          false, // Prevent closing while loading
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );

                    // Check if email already exists
                    bool exists = await dbHelper.emailExists(email);

                    Navigator.pop(context); // Remove loading indicator

                    if (exists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Cet email est déjà utilisé."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      await dbHelper.insertUser({
                        'name': _nameController.text.trim(),
                        'email': email,
                        'phone': _phoneController.text.trim(),
                        'password': _passwordController.text
                            .trim(), // Hash password in real case
                        'city': _selectedCity,
                        'gender': _selectedGender,
                        'birthdate': _selectedDate?.toIso8601String(),
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(" "),
                          backgroundColor: Color.fromARGB(0, 76, 175, 79),
                        ),
                      );

                      // Navigate to another page (optional)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CongratsPageUP()),
                      );
                    }
                  } catch (e) {
                    Navigator.pop(
                        context); // Ensure loading indicator is removed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Erreur: ${e.toString()}"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Signup",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom TextField
  Widget _buildTextField(TextEditingController controller, String hint,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: _inputDecoration(hint),
    );
  }

  // Custom Input Decoration
  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }
}
