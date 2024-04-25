import 'package:flutter/material.dart';
// Required for using Clipboard functionality for sharing
import 'package:share/share.dart'; // Flutter package for sharing content

class EventDetailView extends StatefulWidget {
  final String eventName;
  final String imagePath; // Using a single image path for the cover image

  const EventDetailView({
    Key? key,
    required this.eventName,
    required this.imagePath, required imagePaths,
  }) : super(key: key);

  @override
  _EventDetailViewState createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  bool isSaved = false; // State to track if the event is saved

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.eventName),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.imagePath, // Displaying the event cover image
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Event Description Here', // Placeholder text
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                    // Additional logic to handle saving the event
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    Share.share('Check out this event "${widget.eventName}" at ${widget.imagePath}');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
