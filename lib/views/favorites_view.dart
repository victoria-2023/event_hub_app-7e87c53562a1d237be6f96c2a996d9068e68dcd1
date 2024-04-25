import 'package:flutter/material.dart';

import 'event_detail_view.dart';

class FavoritesView extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteEvents; // This should be passed or managed globally

  const FavoritesView({Key? key, required this.favoriteEvents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: favoriteEvents.length,
        itemBuilder: (context, index) {
          var event = favoriteEvents[index];
          return ListTile(
            title: Text(event['title']),
            subtitle: Text(event['date']), // Assuming each event has a date
            leading: Image.asset(
              event['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailView(
                    eventName: event['title'],
                    imagePaths: event['images'], imagePath: '',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
