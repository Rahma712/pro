import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';

class pro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return GetBuilder<SelectImageViewModel>(
        init: SelectImageViewModel(),
    builder: (controller) => Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding:  EdgeInsets.only(top: 10),
          child: IconButton(onPressed: (){
            Get.back();
          },icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        ),
        title: Padding(
          padding:  EdgeInsets.only(left: 30,top: 10),
          child: Text('Your Product',style: TextStyle(color: Colors.black),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Center(
              child: Container(
                height: 300.0,
                width: double.infinity,
                decoration: controller.imageCoverFile != null ?  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  image: DecorationImage(
                    image: FileImage(controller.output as File),
                    fit: BoxFit.cover,
                  ),
                ) :  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://w7.pngwing.com/pngs/237/758/png-transparent-computer-icons-upload-iphone-x-loading-miscellaneous-angle-text.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

}