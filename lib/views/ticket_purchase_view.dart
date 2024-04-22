import 'package:flutter/material.dart';

class TicketPurchaseView extends StatelessWidget {
  final String eventName;

  const TicketPurchaseView({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Tickets'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ticket for $eventName',
                style: const TextStyle(fontSize: 24),
              ),
              // Include more details and options for ticket purchase
              ElevatedButton(
                onPressed: () {
                  // Handle ticket purchase
                },
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
