
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:http/http.dart' as http;


class SelectImageViewModel extends GetxController {
  /*
  File? imageFile;
  String? picUrl;

   */

  File? imageCoverFile;
  String? coverUrl;
  bool _loading = true;


/*
  cameraImage() async {

    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageFile = File(_pickedFile!.path);
    update();
  }

  galleryImage() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageFile = File(_pickedFile!.path);
    update();
  }

  uploadImageToFirebase() async {
    String _fileName = basename(imageFile!.path);
    Reference _firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'profilePics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(imageFile!);
    picUrl = await (await _uploadTask).ref.getDownloadURL();
    print(picUrl.toString());
  }

 */

  cameraCoverImage() async {

    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageCoverFile = File(_pickedFile!.path);
    update();
  }

  galleryCoverImage() async {
    final _pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 400,
      maxWidth: 400,
    );
    imageCoverFile = File(_pickedFile!.path);
    update();
  }

  uploadCoverImageToFirebase() async {
    String _fileName = basename(imageCoverFile!.path);
    Reference _firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'coverPics/$_fileName');
    UploadTask _uploadTask = _firebaseStorageRef.putFile(imageCoverFile!);
    coverUrl = await (await _uploadTask).ref.getDownloadURL();
    print(coverUrl.toString());
  }

  File? output ;
  Future<void> getImage() async {
    String inputchr = basename(imageCoverFile!.path);
    String url = 'http://localhost:5000/api?query=$inputchr';
    var response = await http.get(url as Uri);
    var data = response.body;
    output = data as File?;
    update();
  }


/*
  pickImage() async{
    var image = imageCoverFile;
    // if(image == null) return null;

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        return null;
      }
    });

    //detectImage(_image);
  }

 */


}