import 'package:flutter/material.dart';
import 'package:go_event/congratsadd.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddEventContent();
  }
}

class AddEventContent extends StatefulWidget {
  @override
  _AddEventContentState createState() => _AddEventContentState();
}

class _AddEventContentState extends State<AddEventContent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

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
  final List<String> categories = [
    'Sociale',
    'Entreprise',
    'Culturel',
    'Sportif',
    'Pédagogique',
    'Communauté',
    'Corporate',
    'Technologie',
    'Autre'
  ];
  String? selectedCity;
  String? selectedCategory;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _dateTimeController.text = DateFormat('yyyy-MM-dd HH:mm').format(
              DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
                  pickedTime.hour, pickedTime.minute));
        });
      }
    }
  }

  Widget _buildInputField(
    TextEditingController controller,
    String labelText, {
    IconData? leadingIcon,
    VoidCallback? onTap,
    bool readOnly = false,
    int maxLines = 1,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black87),
          alignLabelWithHint: true,
          prefixIcon: leadingIcon != null
              ? Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: Icon(leadingIcon, color: Colors.black87),
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'AJOUTER UN ÉVÉNEMENT',
                      style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ajoutez votre événement et attirez plus de participants !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenWidth * 0.04, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField(
                _titleController,
                "Titre de l'événement",
                leadingIcon: Icons.star,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                _dateTimeController,
                "Date et heure",
                leadingIcon: Icons.calendar_today,
                onTap: _selectDateTime,
                readOnly: true,
              ),
              const SizedBox(height: 20),
              // Responsive dropdowns for Ville and Catégorie
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonFormField<String>(
                        value: selectedCity,
                        decoration: InputDecoration(
                          labelText: 'Ville',
                          labelStyle: TextStyle(color: Colors.black87),
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.location_on, color: Colors.black87),
                        ),
                        items: cities
                            .map((city) => DropdownMenuItem(
                                  value: city,
                                  child: Text(
                                    city,
                                    overflow: TextOverflow
                                        .ellipsis, // Prevent text overflow
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedCity = value),
                        isExpanded:
                            true, // Ensure the dropdown expands to fill the space
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add spacing between the dropdowns
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonFormField<String>(
                        value: selectedCategory,
                        decoration: InputDecoration(
                          labelText: 'Catégorie',
                          labelStyle: TextStyle(color: Colors.black87),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.category,
                              color: Colors.black87, size: 20),
                        ),
                        items: categories
                            .map((category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    overflow: TextOverflow
                                        .ellipsis, // Prevent text overflow
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedCategory = value),
                        isExpanded:
                            true, // Ensure the dropdown expands to fill the space
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 56,
                child: TextButton(
                  onPressed: _pickImage,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    alignment: Alignment.center,
                    minimumSize: Size(double.infinity, 56),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, color: Colors.black87),
                      SizedBox(width: 8),
                      Text(
                        'Choisir une image',
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
              if (_image != null) ...[
                SizedBox(height: 20),
                Image.file(_image!, height: 150),
              ],
              const SizedBox(height: 20),
              _buildInputField(
                _priceController,
                "Prix de l'événement",
                leadingIcon: Icons.attach_money,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                _descriptionController,
                "Description",
                leadingIcon: Icons.description,
                maxLines: 5,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to HomePage
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CongratsPageAdd()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  child: Text(
                    'Publier l\'événement',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
