/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _selectedImage;

  Future<void> _uploadImage() async {
    if (_selectedImage == null) {
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse('http://your_server_url/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', _selectedImage!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var imageUrl = jsonDecode(responseBody)['image_url'];
      // Handle the uploaded image URL
    }
  }

  Future<void> _selectImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Image'),
              ),
            ] else ...[
              ElevatedButton(
                onPressed: _selectImage,
                child: Text('Select Image'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImageUploadScreen(),
  ));
}

 */