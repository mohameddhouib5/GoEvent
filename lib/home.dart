import 'package:flutter/material.dart';
import 'package:go_event/addevent.dart';
import 'package:go_event/joinedevent.dart';
import 'package:go_event/reservedevent.dart';
import 'package:go_event/searchpage.dart';
import 'package:go_event/updateprofile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AddEventPage(),
    const SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Accueil'),
              NavigationDestination(icon: Icon(Icons.add), label: 'Ajouter'),
              NavigationDestination(
                  icon: Icon(Icons.search), label: 'Recherche'),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String imageUrl;
  final String name;

  Category({required this.imageUrl, required this.name});
}

class City {
  final String name;
  final String imageUrl;

  City({required this.name, required this.imageUrl});
}

class User {
  final String imageUrl;
  final String name;
  final String surname;
  final String city;

  User({
    required this.imageUrl,
    required this.name,
    required this.surname,
    required this.city,
  });
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Category> categories = [
    Category(
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/03/13/22/42/button-7850924_960_720.png',
        name: 'Business'),
    Category(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/04/10/10/08/icon-1319606_960_720.png',
        name: 'Sociale'),
    Category(
        imageUrl:
            'https://tep.global/wp-content/uploads/2024/04/cultural-identity-scaled.jpeg',
        name: 'Culturelle'),
    Category(
        imageUrl:
            'https://cdn.paris.fr/paris/2024/10/18/huge-bf63eb4547bcee1ed2136b87bfce3bc7.jpg',
        name: 'Sports'),
    Category(
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/09/11/19/57/ai-generated-8247500_960_720.png',
        name: 'Pédagogique'),
    Category(
        imageUrl: 'https://blogs.illinois.edu/files/8605/748590137/194651.png',
        name: 'Communauté'),
    Category(
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/12/18/00/43/business-5840870_1280.png',
        name: 'Corporate'),
    Category(
        imageUrl: 'https://cdn-icons-png.flaticon.com/256/11048/11048212.png',
        name: 'Technologie'),
    Category(
        imageUrl:
            'https://cdn.pixabay.com/photo/2021/12/21/04/58/add-6884593_1280.png',
        name: 'Plus'),
  ];

  final List<City> cities = [
    City(
      name: 'Tunis',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/10/18/11/tunis-1248870_960_720.jpg',
    ),
    City(
      name: 'Sfax',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/8/83/Sfax%2Cfa%C3%A7ades_de_l%E2%80%99immeuble.jpg',
    ),
    City(
      name: 'Sousse',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/b/b9/Sousse_Ribat_Aussicht.JPG',
    ),
    City(
      name: 'Kairouan',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/2/2b/Vue_a%C3%A9rienne_rapproch%C3%A9e_de_la_Grande_Mosqu%C3%A9e_de_Kairouan.jpg',
    ),
    City(
      name: 'Hammamet',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSunIX6pL0rbhFOSHOBYQQHAtpEzUoNH9Xtlg&s',
    ),
  ];

  final List<User> users = [
    User(
      imageUrl:
          'https://cdn.pixabay.com/photo/2021/05/07/15/12/human-6236358_960_720.jpg',
      name: 'Amine',
      surname: 'Salah',
      city: 'Tunis',
    ),
    User(
      imageUrl:
          'https://thumbs.dreamstime.com/b/young-indian-man-happy-outdoors-looking-camera-39595562.jpg',
      name: 'Aymen',
      surname: 'Trabelsi',
      city: 'Sfax',
    ),
    User(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzT_SZfAqq_hXIf7fkgW-YXau_Zspa6NOr5Q&s',
      name: 'Sana ',
      surname: 'Romdhani',
      city: 'Sousse',
    ),
    User(
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/03/15/10/21/fashion-4056729_960_720.jpg',
      name: 'Bolbeba',
      surname: 'karwi',
      city: 'Kairouan',
    ),
    User(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/08/31/03/21/girl-5531217_960_720.jpg',
      name: 'Chaima',
      surname: 'Ben Salah',
      city: 'Hammamet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 1, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Categories'),
                  _buildHorizontalList(categories),
                  const SizedBox(height: 40),
                  _buildSectionTitle('Villes'),
                  _buildCityList(cities),
                  const SizedBox(height: 46),
                  _buildSectionTitle('Meilleurs organisateurs'),
                  _buildUserList(users),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20, // Adjust the radius as needed
          backgroundImage: NetworkImage(
            'https://res.cloudinary.com/dhbqealwn/image/upload/v1721656831/image/Black_and_White_Minimalist_Positive_Quote_Instagram_Post-removebg-preview.png.png',
          ), // Profile image URL
        ),
        const SizedBox(width: 10),
        const Text('Mohamed Dhouib',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(3.0), // Padding inside the circle
            decoration: BoxDecoration(
              color:
                  Colors.transparent, // No background color inside the circle
              shape: BoxShape.circle, // Makes the container circular
              border: Border.all(
                  color: const Color.fromARGB(141, 158, 158, 158),
                  width: 1.0), // Gray border
            ),
            child: const Icon(
              Icons.bookmark_border,
              color: Colors.black, // Icon color (you can adjust it)
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReservedEventPage(),
              ),
            );
          },
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(3.0), // Padding inside the circle
            decoration: BoxDecoration(
              color:
                  Colors.transparent, // No background color inside the circle
              shape: BoxShape.circle, // Makes the container circular
              border: Border.all(
                  color: const Color.fromARGB(141, 158, 158, 158),
                  width: 1.0), // Gray border
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.black, // Icon color (you can adjust it)
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateProfilePage(),
              ),
            );
          },
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(3.0), // Padding inside the circle
            decoration: BoxDecoration(
              color:
                  Colors.transparent, // No background color inside the circle
              shape: BoxShape.circle, // Makes the container circular
              border: Border.all(
                  color: const Color.fromARGB(141, 158, 158, 158),
                  width: 1.0), // Gray border
            ),
            child: const Icon(
              Icons.list_outlined,
              color: Colors.black, // Icon color (you can adjust it)
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JoinedEventsPage(),
              ),
            );
          },
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(3.0), // Padding inside the circle
            decoration: BoxDecoration(
              color:
                  Colors.transparent, // No background color inside the circle
              shape: BoxShape.circle, // Makes the container circular
              border: Border.all(
                  color: const Color.fromARGB(141, 158, 158, 158),
                  width: 1.0), // Gray border
            ),
            child: const Icon(
              Icons.directions_walk_outlined,
              color: Colors.red, // Icon color
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  Widget _buildHorizontalList(List<Category> categories,
      {double height = 100}) {
    return SizedBox(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  width: height - 30,
                  height: height - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(category.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(category.name, style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCityList(List<City> cities) {
    return SizedBox(
      height: 200, // Adjust height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cities.map((city) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildCityCard(city),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCityCard(City city) {
    return Container(
      width: 300, // Increased width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(city.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                city.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return SizedBox(
      height: 190, // Adjust height as needed
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: users.map((user) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildUserCard(user),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUserCard(User user) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 160, // Slightly wider
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 100, // Increased image size
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(user.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${user.name} ${user.surname}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.city,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
