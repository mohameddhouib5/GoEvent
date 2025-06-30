import 'package:flutter/material.dart';

class EventManagementPage extends StatelessWidget {
  final String title;
  final String location;
  final String description;
  final String image;

  // Constructor to accept event data
  const EventManagementPage({
    super.key,
    required this.title,
    required this.location,
    required this.description,
    required this.image,
  });

  // Function to show the confirmation modal for deletion
  void _showDeleteConfirmationModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmer la suppression"),
          content:
              const Text("Êtes-vous sûr de vouloir supprimer cet événement ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the modal
              },
              child: const Text("Annuler"),
            ),
            TextButton(
              onPressed: () {
                // Perform deletion logic here
                Navigator.pop(context); // Close the modal
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Événement supprimé")),
                );
              },
              child:
                  const Text("Supprimer", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lists of random Tunisian names, images, and phone numbers
    List<String> tunisianNames = [
      'Mohamed Dhouib',
      'Fadhel Ben Achour',
      'Ali Ben Yousse',
      'Nouri Ben Slimane',
      'Ahmed Ben Salah',
      'Sami Ben Amor',
      'Hassan Ben Ali',
      'Ali Ben Ammar'
    ];
    List<String> randomImages = [
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989718/GoEVENT/mrlthjvoca2e2n4hnc8h.jpg',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989743/GoEVENT/rydpqhjsiaujlagbdlrj.jpg',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989768/GoEVENT/jdichsedfhxh8zpvt23h.jpg',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989815/GoEVENT/zewaiw7vnias3afzq5p5.webp',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989833/GoEVENT/dcyhfozjgxywphiuvbg9.jpg',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989867/GoEVENT/ym7p4xrz30cuginw55b0.avif',
      'https://res.cloudinary.com/dhbqealwn/image/upload/v1741989913/GoEVENT/cfeyxwvope4mdwzu0obp.jpg',
      'https://www.lippc2s.fr/wp-content/uploads/TB.jpg'
    ];
    List<String> randomPhoneNumbers = [
      '12345678',
      '87654321',
      '11223344',
      '55667788',
      '99887766',
      '55443322',
      '33445566',
      '77889900'
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Details
            Card(
              elevation: 0, // Remove elevation for transparency
              color: Colors.transparent, // Make card background transparent
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.transparent),
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(location,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey)),
                        const SizedBox(height: 8),
                        Text(description, style: const TextStyle(fontSize: 14)),
                        const SizedBox(height: 16),
                        // Supprimer Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 120.0, vertical: 20.0),
                            ),
                            onPressed: () =>
                                _showDeleteConfirmationModal(context),
                            child: const Text('Supprimer',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("Membres inscrits",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: tunisianNames.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0, // Remove elevation for transparency
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Random Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            randomImages[index],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Random Name
                        Text(tunisianNames[index],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        // Random Phone Number
                        Text("Phone: ${randomPhoneNumbers[index]}",
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                            ),
                            value: "Action",
                            items: const [
                              DropdownMenuItem(
                                  value: "Action", child: Text("Action")),
                              DropdownMenuItem(
                                  value: "Validé", child: Text("Validé")),
                              DropdownMenuItem(
                                  value: "Invalidé", child: Text("Invalidé")),
                            ],
                            onChanged: (value) {},
                            icon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
