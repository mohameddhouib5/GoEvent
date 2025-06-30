import 'package:flutter/material.dart';
import 'package:go_event/searchresult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> categories = [
    'Concert',
    'Théâtre',
    'Sport',
    'Exposition',
    'Conférence'
  ];
  final List<String> cities = ['Tunis', 'Sfax', 'Sousse', 'Bizerte', 'Nabeul'];

  String? selectedCategory;
  String? selectedCity;
  DateTime? selectedDate; // To store the selected date
  RangeValues priceRange = const RangeValues(0, 1000); // Default price range

  // Define padding variable
  final EdgeInsets p = const EdgeInsets.symmetric(
      horizontal: 16.0, vertical: 40.0); // Adjusted padding

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears
      body: SingleChildScrollView(
        // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0) + p,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Trouvez des événements près de chez vous !',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher des événements...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                ),
              ),
              const SizedBox(height: 40),
              _buildDropdown(
                'Filtre par catégorie',
                categories,
                selectedCategory,
                (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              _buildDropdown(
                'Filtre par ville',
                cities,
                selectedCity,
                (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
              ),
              GestureDetector(
                onTap: () => _openDatePicker(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                    'Filtre par date',
                    value: selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : null,
                  ),
                ),
              ),
              _buildPriceRangeSlider(),
              const SizedBox(height: 40), // Add spacing before the button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultsPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
                label: const Text('Rechercher', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        ),
        hint: Text(label),
        value: selectedValue,
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField(String label, {String? value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          suffixIcon: value != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(value),
                )
              : null,
        ),
        readOnly: true, // Make the field non-editable
      ),
    );
  }

  void _openDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate; // Update the selected date
      });
    }
  }

  Widget _buildPriceRangeSlider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Filtre par prix'),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000,
              divisions: 100,
              labels: RangeLabels(
                priceRange.start.toString(),
                priceRange.end.toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            Text(
              'De ${priceRange.start.toInt()} à ${priceRange.end.toInt()}',
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
