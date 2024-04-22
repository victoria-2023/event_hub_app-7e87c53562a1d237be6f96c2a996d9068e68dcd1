import 'package:flutter/material.dart';

class EventDetailView extends StatelessWidget {
  final String eventName;
  final String imagePath; // Path to the event image

  const EventDetailView({
    super.key,
    required this.eventName,
    required this.imagePath, required List imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF2EE), // Consistent background color
      appBar: AppBar(
        title: Text(eventName, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 250, // Cover photo height
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Event Description Here', // Placeholder for event description
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Additional event details can be added below
          ],
        ),
      ),
    );
  }
}
