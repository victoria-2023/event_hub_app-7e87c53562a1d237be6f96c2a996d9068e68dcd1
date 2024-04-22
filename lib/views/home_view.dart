import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_creation_view.dart';
import 'event_detail_view.dart';
import 'user_profile_view.dart';
import 'settings_view.dart'; // Make sure to have a settings view implemented

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  List<Map<String, dynamic>> get events => [
    {'title': 'Concert', 'image': 'lib/assets/images/concert.jpg'},
    {'title': 'Art Exhibition', 'image': 'lib/assets/images/art_exhibition.jpg'},
    {'title': 'Theatre Play', 'image': 'lib/assets/images/theatre_play.jpg'},
  ];

  void _navigateToProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileView()));
  }

  void _navigateToSettings() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventHub', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFAF2EE),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Navigate to notifications view
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black),
            onSelected: (value) {
              switch (value) {
                case 'Profile':
                  _navigateToProfile();
                  break;
                case 'Settings':
                  _navigateToSettings();
                  break;
                case 'Log Out':
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                  break;
              // Add other cases as per requirement
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Ratings', 'Log Out'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFAF2EE),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  var event = events[index];
                  return Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image.asset(
                        event['image'], // Use actual asset paths
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(event['title']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetailView(
                              eventName: event['title'],
                              imagePath: event['image'], imagePaths: const [],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const EventCreationView()),
          );
        },
        backgroundColor: const Color(0xFF4A306D),
        child: const Icon(Icons.add),
      ),
    );
  }
}
