import 'package:flutter/material.dart';
import 'package:go_event/eventmanagement.dart';

class JoinedEventsPage extends StatelessWidget {
  JoinedEventsPage({super.key});

  final List<Map<String, String>> events = [
    {
      "title": "Concert en plein air : DJ Snake Live 🎶",
      "location": "Parc central, Sfax",
      "description":
          "Vivez une nuit inoubliable avec DJ Snake, l’un des artistes les plus influents de la scène électro mondiale. Un show spectaculaire avec jeux de lumières, effets pyrotechniques et une ambiance unique sous les étoiles..",
      "image":
          "https://www.francebleu.fr/s3/cruiser-production/2020/06/44596e32-e897-4e91-94b0-0b7c3339f7d1/1200x680_95438567_1653751264748526_5788465361988878336_n.jpg"
    },
    {
      "title": "🧠🔒 Conférence : IA et Cybersécurité – Enjeux et Avenir",
      "location": "Université de Sfax, Amphithéâtre A1",
      "description":
          "La cybersécurité est plus que jamais un enjeu majeur. Venez découvrir comment l’intelligence artificielle révolutionne la protection des données et la lutte contre les cyberattaques. Des experts de renommée internationale partageront leurs visions et solutions innovantes.",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOC610waO8p0aN30W-HTcQrb2p6gOvMeiT2w&s"
    },
    {
      "title": "🎮⚽ Tournoi e-sport FIFA 25 – Championnat de Tunisie",
      "location": "Gaming Zone, Tunis",
      "description":
          "Viens montrer ton talent et affronte les meilleurs joueurs de FIFA 25 ! Un tournoi avec un cash prize de 5000 TND pour le vainqueur et de nombreux cadeaux pour les participants. Matches en streaming live, casters professionnels et une ambiance de folie !",
      "image": "https://i.ytimg.com/vi/lDiBPi2wy9M/maxresdefault.jpg"
    },
    {
      "title": "🍽️🌿 Festival de la Gastronomie Locale – Saveurs de Tunisie",
      "location": "Médina de Sousse",
      "description":
          "Plongez dans un voyage culinaire à travers les meilleures spécialités tunisiennes. Des chefs étoilés, des ateliers interactifs et des dégustations de plats traditionnels revisités vous attendent !",
      "image":
          "https://realites.com.tn/fr/wp-content/uploads/2024/07/6069_WtloopnZe5Ql8Rn6c6xaFNfSxusWCYN4LbbIimKl.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Mes événements"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return _buildEventCard(context, events[index]);
          },
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, Map<String, String> event) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(event["image"]!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            event["title"]!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 4),
          Text(
            event["location"]!,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              event["description"]!,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to EventManagementPage with the event details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventManagementPage(
                      title: event["title"]!,
                      location: event["location"]!,
                      description: event["description"]!,
                      image: event["image"]!,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Voir les détails",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
