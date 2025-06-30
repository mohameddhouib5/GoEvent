import 'package:flutter/material.dart';

class ReservedEventPage extends StatelessWidget {
  const ReservedEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événement réservé'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildEventCard(
            status: 'validé',
            title: 'Concert en plein air : DJ Snake Live',
            place: 'Parc central, Sfax',
            description:
                'Une soirée électrisante avec DJ Snake, l’un des DJ les plus célèbres au monde. Venez vibrer au rythme de ses meilleurs titres dans une ambiance enflammée sous les étoiles.',
            imageUrl:
                'https://images.stockcake.com/public/6/2/9/629c22b1-49f2-4934-ab8c-cb62256cc9cb_large/dj-at-concert-stockcake.jpg',
          ),
          const SizedBox(height: 16.0),
          _buildEventCard(
            status: 'invalidé',
            title: 'Conférence : IA et Cybersécurité',
            place: 'Université de Sfax, Amphithéâtre A',
            description:
                'Découvrez comment l’intelligence artificielle révolutionne la cybersécurité. Des experts du domaine partageront leurs connaissances à travers des conférences et des ateliers interactifs.',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzrdJ8uOj5T51mZdRGB-6H0QizVomAIUcfEw&s',
          ),
          const SizedBox(height: 16.0),
          _buildEventCard(
            status: 'en attente',
            title: 'Tournoi e-sport FIFA 25',
            place: 'Gaming Zone, Tunis',
            description:
                'Affrontez les meilleurs joueurs de FIFA 25 dans un tournoi compétitif avec un cash prize et des cadeaux pour les participants.',
            imageUrl:
                'https://media.contentapi.ea.com/content/dam/ea/fifa/fifa-mobile/season-5/global_assets/images/2023/03/fifa-mobile-grid-tile-season-5-16x9-1.jpg.adapt.crop16x9.1023w.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String status,
    required String title,
    required String place,
    required String description,
    required String imageUrl,
  }) {
    Color backgroundColor;
    String buttonText;

    switch (status) {
      case 'validé':
        backgroundColor = Colors.green;
        buttonText = 'Validé';
        break;
      case 'invalidé':
        backgroundColor = Colors.red;
        buttonText = 'Invalidé';
        break;
      case 'en attente':
        backgroundColor = Colors.grey;
        buttonText = 'En attente';
        break;
      default:
        backgroundColor = Colors.grey;
        buttonText = 'Inconnu';
    }

    return Card(
      elevation: 0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  place,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          buttonText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Consulter',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
