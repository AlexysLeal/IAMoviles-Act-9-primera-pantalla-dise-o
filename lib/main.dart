import 'package:flutter/material.dart';

// Data model for a profile
class Profile {
  final String name;
  final Color color;

  const Profile({required this.name, required this.color});
}

// Dummy data for profiles based on the image
final List<Profile> profiles = [
  const Profile(name: 'Perfil 1', color: Color(0xFFD35400)), // Orange
  const Profile(name: 'Perfil 2', color: Color(0xFF16A085)), // Teal
  const Profile(name: 'Perfil 3', color: Color(0xFFF39C12)), // Yellow
  const Profile(name: 'Perfil 4', color: Color(0xFF2ECC71)), // Green
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Roboto', // A font that looks similar to Netflix's
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.grey),
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ),
      home: const ProfileSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a LayoutBuilder to make the grid responsive
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'NETFLIX',
          style: TextStyle(
            color: const Color(0xFFE50914), // Netflix Red
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ), // Max width for larger screens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Elige tu perfil',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Always 2 columns
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: profiles.length + 1, // +1 for the "Add Profile"
                  itemBuilder: (context, index) {
                    if (index < profiles.length) {
                      return ProfileItem(profile: profiles[index]);
                    } else {
                      return const AddProfileItem();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final Profile profile;

  const ProfileItem({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle profile selection
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: profile.color,
              borderRadius: BorderRadius.circular(8),
            ),
            // In a real app, you would place your avatar image here
            child: const Icon(Icons.person, color: Colors.white, size: 80),
          ),
          const SizedBox(height: 12),
          Text(profile.name, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}

class AddProfileItem extends StatelessWidget {
  const AddProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle add profile action
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade700, width: 2),
            ),
            child: const Icon(Icons.add, color: Colors.grey, size: 60),
          ),
          const SizedBox(height: 12),
          Text('Añadir perfil', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
