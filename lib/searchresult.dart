import 'package:flutter/material.dart';
import 'package:go_event/addevent.dart';
import 'package:go_event/detailssearch.dart';
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
      home: SearchResultsPage(),
    );
  }
}

class Event {
  final String title;
  final String creator;
  final String category;
  final String price;
  final String date;
  final String description;
  final String imageUrl;

  Event({
    required this.title,
    required this.creator,
    required this.category,
    required this.price,
    required this.date,
    required this.description,
    required this.imageUrl,
  });
}

class SearchResultsPage extends StatelessWidget {
  SearchResultsPage({super.key});

  final List<Event> events = [
    Event(
      title: "Concert de Musique Rap avec l'artiste Samar",
      creator: "Samar Music Productions",
      category: "Musique Rap",
      price: "15 TND (entrée générale), 30 TND (VIP)",
      date: "25 mars 2025, 20:00",
      description:
          "Venez vivre un concert énergique et intense avec l'artiste rap Samar. Cet événement promet des performances exceptionnelles, des morceaux inédits et une atmosphère électrisante. Si vous êtes fan de rap tunisien, c'est un événement à ne pas manquer pour découvrir les nouvelles tendances musicales.",
      imageUrl:
          'https://res.cloudinary.com/dhbqealwn/image/upload/v1741969285/GoEVENT/uoyjattknpie8swzwbsu.webp',
    ),
    Event(
      title: "Exposition de Photographie 'Regards sur Sfax'",
      creator: "Galerie d'Art Contemporain de Sfax",
      category: "Art, Photographie",
      price: "Entrée gratuite",
      date: "10 avril 2025, 09:00 – 18:00",
      description:
          "Une exposition de photographie qui capture la beauté et la diversité de Sfax à travers les yeux de photographes locaux. Découvrez des images saisissantes de la ville, de ses habitants, et de ses paysages urbains. Cette exposition vous invite à voir Sfax sous un autre angle.",
      imageUrl:
          'https://cdn.futura-sciences.com/sources/images/dossier/773/07-773.jpg',
    ),
    Event(
      title: "Spectacle de Danse Urbaine 'Sfax Dance Battle'",
      creator: "Urban Dance Academy",
      category: "Danse Urbaine",
      price: "10 TND",
      date: "15 mai 2025, 18:00",
      description:
          "Un événement dynamique qui réunit les meilleurs danseurs de breakdance, hip-hop et danse contemporaine de Sfax et des environs. Assistez à des batailles de danse où les talents locaux rivalisent pour le titre de champion. L'événement est ouvert à tous ceux qui aiment l'énergie de la danse urbaine.",
      imageUrl:
          'https://res.cloudinary.com/dhbqealwn/image/upload/v1741969309/GoEVENT/klspmzsday12yrmofiqq.jpg',
    ),
    Event(
      title: "Festival de Théâtre 'Sfax en Scène'",
      creator: "Théâtre National de Sfax",
      category: "Théâtre",
      price: "20 TND (entrée générale), 40 TND (VIP)",
      date: "5 juin 2025, 20:00",
      description:
          "Un festival dédié aux arts dramatiques, avec des représentations théâtrales de compagnies locales et internationales. 'Sfax en Scène' met en avant des œuvres originales qui explorent des thèmes sociaux, politiques, et culturels, offrant une expérience immersive pour les amateurs de théâtre.",
      imageUrl:
          'https://res.cloudinary.com/dhbqealwn/image/upload/v1741969330/GoEVENT/wqqubbjfwehslj6oqf9x.jpg',
    ),
    Event(
      title: "Conférence sur la Transition Énergétique à Sfax",
      creator: "Université de Sfax, Département d'Énergie",
      category: "Conférence, Environnement",
      price: "30 TND (professionnels), 10 TND (étudiants)",
      date: "1er juillet 2025, 09:00 – 13:00",
      description:
          "Cette conférence réunira des experts dans le domaine de la transition énergétique, abordant des sujets comme l'énergie renouvelable, l'efficacité énergétique, et les solutions écologiques pour un avenir durable. Une excellente occasion d'en apprendre davantage sur les défis et les opportunités dans le domaine de l'énergie en Tunisie.",
      imageUrl:
          'https://res.cloudinary.com/dhbqealwn/image/upload/v1741969337/GoEVENT/efl9uzjju9waacntru9b.jpg',
    ),
  ];
  void onDestinationSelected(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddEventPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Event Image
                        Container(
                          width: 120,
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(event.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Text Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                event.creator,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                event.category,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                event.date,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Button to go to details page
                              Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 10,
                                    ),
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EventDetailsPage(event: event),
                                      ),
                                    );
                                  },
                                  child: const Text("Détails"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: NavigationBar(
            height: 50,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            surfaceTintColor: Colors.transparent,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Accueil",
              ),
              NavigationDestination(icon: Icon(Icons.add), label: "Ajouter"),
              NavigationDestination(
                  icon: Icon(Icons.search), label: "Recherche"),
            ],
            selectedIndex: 2,
            onDestinationSelected: (index) =>
                onDestinationSelected(context, index),
          ),
        ));
  }
}
