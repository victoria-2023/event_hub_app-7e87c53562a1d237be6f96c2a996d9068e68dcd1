import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder for user details, these should ideally come from a user model or similar structure
    const String userName = "User's Name";
    const String userEmail = "user@example.com";

    return Scaffold(
      backgroundColor: const Color(0xFFFAF2EE), // Consistent background color
      appBar: AppBar(
        title: const Text('User Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Example profile picture
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              const Text(userName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(userEmail, style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Functionality to edit profile could be implemented here
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: const Color(0xFF4A306D),
                ),
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
