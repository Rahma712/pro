import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'com/con_1.dart';
import 'com/con_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class MlModel extends StatefulWidget {
  @override
  State<MlModel> createState() => _MlModelState();
}

class _MlModelState extends State<MlModel> {

  File? _file;
  String? _colorizedImage;
  Uint8List? _colorizedImage1;
  Uint8List? _colorizedImage2;

  Future pickImage () async
  {
    final myfile = await  ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
    });
  }

  Future<void> Predict () async
  {
    if (_file == null) {
      return;
    }
    var request = http.MultipartRequest('POST', Uri.parse('https://8dc0-197-38-88-243.ngrok-free.app/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', _file!.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      var colorizedImageData = await response.stream.bytesToString();
      final decodedResponse = json.decode(colorizedImageData);
      final colorizedImage1Base64 = decodedResponse['colorized_image1'];
      final colorizedImage2Base64 = decodedResponse['colorized_image2'];
      setState(() {
        //_colorizedImage = base64Encode(colorizedImageData);
        _colorizedImage1 = base64.decode(colorizedImage1Base64);
        _colorizedImage2 = base64.decode(colorizedImage2Base64);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Image Colorization', style: TextStyle(color: Constants.kPinkColor),)),
        backgroundColor: Constants.kGreenColor,
      ),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.1,
            left: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.3,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 200,
                  sigmaY: 200,
                ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.5,
                        height: screenWidth * 0.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: _file != null
                              ? DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: FileImage(_file!),
                          )
                              : DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                            image: AssetImage('assets/img-onboarding.png'),
                          ),
                        ),
                      ),
                      Container(
                        width: 500 * 0.2,
                        height: 500 * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:AssetImage('assets/arrow.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 10.0),
                        child: Row(
                          children: [
                            _colorizedImage1 != null ? Image.memory(_colorizedImage1!,width: screenWidth * 0.4,height: screenHeight * 0.2,) : Container(
                              width: screenWidth * 0.4 ,
                              height: screenHeight * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:AssetImage('assets/gg.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: screenHeight * 0.005),
                            _colorizedImage2 != null ? Image.memory(_colorizedImage2!,width: screenWidth * 0.4,height: screenHeight * 0.2,) : Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:AssetImage('assets/gg.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 25.0),
                          child: Row(
                            children: [
                              CustomOutline(
                                strokeWidth: 3,
                                radius: 20,
                                padding: const EdgeInsets.all(3),
                                width: 150,
                                height: 40,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Constants.kPinkColor, Constants.kGreenColor],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Constants.kPinkColor.withOpacity(0.5),
                                        Constants.kGreenColor.withOpacity(0.5)
                                      ],
                                    ),
                                  ),
                                  child:ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Constants.kGreenColor),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20), // Set the border radius here
                                        ),
                                      ),

                                    ),
                                    onPressed: (){
                                      pickImage();
                                    },
                                    child: Text('Pick Image Here',style: TextStyle(
                                      fontSize: 14,
                                      color: Constants.kPinkColor,
                                    )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomOutline(
                                strokeWidth: 3,
                                radius: 20,
                                padding: const EdgeInsets.all(3),
                                width: 150,
                                height: 40,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Constants.kPinkColor, Constants.kGreenColor],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Constants.kPinkColor.withOpacity(0.5),
                                        Constants.kGreenColor.withOpacity(0.5)
                                      ],
                                    ),
                                  ),
                                  child:ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Constants.kGreenColor,),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20), // Set the border radius here
                                        ),
                                      ),
                                    ),
                                    onPressed: (){
                                      Predict();
                                    },
                                    child: Text('Colorize Image',style: TextStyle(
                                      fontSize: 14,
                                      color: Constants.kPinkColor,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}