import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const FaceRecognitionApp());
}

class FaceRecognitionApp extends StatelessWidget {
  const FaceRecognitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Recognition',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();

  File? image1;
  File? image2;

  Future<void> _showImageSourceDialog(Function(ImageSource) onSourceSelected) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  onSourceSelected(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  onSourceSelected(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage1() async {
    await _showImageSourceDialog((ImageSource source) async {
      try {
        final XFile? picked = await _picker.pickImage(
          source: source,
          imageQuality: 100,
        );
        if (picked != null) {
          setState(() {
            image1 = File(picked.path);
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image: $e')),
          );
        }
      }
    });
  }

  Future<void> pickImage2() async {
    await _showImageSourceDialog((ImageSource source) async {
      try {
        final XFile? picked = await _picker.pickImage(
          source: source,
          imageQuality: 100,
        );
        if (picked != null) {
          setState(() {
            image2 = File(picked.path);
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error picking image: $e')),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Recognition"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickImage1,
              child: const Text("Pick Image 1"),
            ),
            const SizedBox(height: 8),
            image1 != null
                ? Image.file(image1!, height: 120)
                : const Text("No image selected"),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: pickImage2,
              child: const Text("Pick Image 2"),
            ),
            const SizedBox(height: 8),
            image2 != null
                ? Image.file(image2!, height: 120)
                : const Text("No image selected"),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Compare Faces"),
            ),
          ],
          
        ),
      ),
    );
  }
}
