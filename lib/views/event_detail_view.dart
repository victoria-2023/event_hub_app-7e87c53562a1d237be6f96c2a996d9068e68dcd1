import 'package:flutter/material.dart';

class EventDetailView extends StatelessWidget {
  final String eventName;
  final List<String> imagePaths; // Accepts multiple image paths

  const EventDetailView({
    super.key,
    required this.eventName,
    required this.imagePaths, required imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventName, style: TextStyle(color: Colors.black)), // Ensuring title color is black
        backgroundColor: const Color(0xFFFAF2EE), // Consistent beige background as other pages
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250, // Fixed height for image carousel
              child: PageView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (context, index) => Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Event Description Here', // Placeholder for actual event description
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Additional widgets or details about the event can be added here
          ],
        ),
      ),
    );
  }
}
