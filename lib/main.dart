import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Artstagram",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.chat_bubble_outline, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            StoriesSection(),
            Divider(height: 1, thickness: 0.5),
            PostCard(
              username: "anna_dev",
              imagePath: "assets/post2.jpg",
              caption: "Make it simple",
            ),
            PostCard(
              username: "mark_design",
              imagePath: "assets/post1.jpg",
              caption: "Collage time!",
            ),
            PostCard(
                username: "xziia_",
                imagePath: "assets/poost1.jpg",
                caption: "beautiful",
            ),
            PostCard(
                username: "banana_fruit",
                imagePath: "assets/poost2.jpg",
                caption: "red",
            ),
          ],
        ),
      ),
    );
  }
}

class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110, // Fixed height to prevent overflow
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          StoryCircle(username: "Your Story", imagePath: "assets/profile.jpg"),
          StoryCircle(username: "Anna", imagePath: "assets/post2.jpg"),
          StoryCircle(username: "Mark", imagePath: "assets/post1.jpg"),
        ],
      ),
    );
  }
}

class StoryCircle extends StatelessWidget {
  final String username;
  final String imagePath;

  const StoryCircle({super.key, required this.username, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 5),
          Text(username, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String imagePath;
  final String caption;

  const PostCard({super.key, required this.username, required this.imagePath, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(radius: 15, backgroundImage: AssetImage(imagePath)),
                const SizedBox(width: 10),
                Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Image.asset(imagePath, width: double.infinity, height: 350, fit: BoxFit.cover),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 15),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 15),
                Icon(Icons.send),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text("$username $caption"),
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget { const SearchPage({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("Search"))); }
class AddPostPage extends StatelessWidget { const AddPostPage({super.key}); @override Widget build(BuildContext context) => const Scaffold(body: Center(child: Text("Add Post"))); }

// --- FIXED PROFILE PAGE ---
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("doughtea_", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.add_box_outlined, color: Colors.black),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Stats Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn("2", "Posts"),
                        _buildStatColumn("150", "Followers"),
                        _buildStatColumn("200", "Following"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("doughtea_", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Digital art creator ✨"),
                  Text("Post cute things"),
                ],
              ),
            ),
            const SizedBox(height: 15),
            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // My Posts Grid
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: const [
                Image(image: AssetImage("assets/poost3.jpg"), fit: BoxFit.cover),
                Image(image: AssetImage("assets/profile.jpg"), fit: BoxFit.cover),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Helper function for the stats
  Column _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}