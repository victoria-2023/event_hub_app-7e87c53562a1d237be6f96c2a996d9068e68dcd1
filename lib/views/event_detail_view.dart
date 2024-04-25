import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart'; // Import for photo upload functionality
// For date formatting

class EventDetailView extends StatefulWidget {
  final String eventName;
  final List<String> imagePaths; // Accepts multiple image paths for displaying images

  const EventDetailView({
    Key? key,
    required this.eventName,
    required this.imagePaths, required imagePath,
  }) : super(key: key);

  @override
  _EventDetailViewState createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<EventDetailView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  XFile? _imageFile; // Variable to store the image file
  final ImagePicker _picker = ImagePicker(); // Image picker instance

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.imagePaths.isNotEmpty)
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    itemCount: widget.imagePaths.length,
                    itemBuilder: (context, index) => Image.asset(
                      widget.imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Event Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Event Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () => _pickImage(),
                child: const Text('Upload Event Image'),
              ),
              if (_imageFile != null)
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(_imageFile!.path)), // Display the selected image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createEvent,
                child: const Text('Save Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery); // Pick image
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  void _createEvent() {
    if (_titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      // Assuming logic to save the event to a database or state management solution

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event successfully created')),
      );

      // Optionally clear the form or navigate away
      Navigator.pop(context);
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DateTime?>('_selectedDate', _selectedDate));
  }
}
