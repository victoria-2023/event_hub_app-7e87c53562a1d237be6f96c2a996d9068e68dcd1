import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  final TextEditingController _feedbackController = TextEditingController();

  FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _feedbackController,
              decoration: const InputDecoration(
                labelText: 'Your feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle feedback submission
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
