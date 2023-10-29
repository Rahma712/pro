import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled_ai_1/const.dart';
import 'package:untitled_ai_1/model.dart';
import 'package:untitled_ai_1/pro.dart';
import 'package:untitled_ai_1/sp.dart';


void main()
{
  runApp(MlApp());
}

class MlApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );

  }
}





/*
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();



}

 */
/*
class _MyAppState extends State<MyApp>
{
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<SelectImageViewModel>(
        init: SelectImageViewModel(),
          builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: defualtColor,
            title: Center(child: Text('Image Colorization')),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.0,
                ),
                Container(
                  height: 250.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 300.0,
                                width: double.infinity,
                                decoration: controller.imageCoverFile != null ?  BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: FileImage(controller.imageCoverFile!),
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
                              IconButton(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Container(
                                        child: Text(
                                          'Choose option',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: defualtColor,
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(
                                            height: 1,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              try {
                                                await controller.cameraCoverImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            },
                                            title: Container(
                                              child: Text(
                                                'Camera',
                                              ),
                                            ),
                                            leading: Icon(
                                              Icons.camera,
                                              color: defualtColor,
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              try {
                                                await controller.galleryCoverImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            },
                                            title: Container(
                                              child: Text(
                                                'Gallery',
                                              ),
                                            ),
                                            leading: Icon(
                                              Icons.account_box,
                                              color: defualtColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: CircleAvatar(
                                  backgroundColor: defualtColor,
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ]),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: defualtColor,
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            controller.getImage();
                            Get.to(pro());
                            /*
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              await controller.uploadImageToFirebase();
                              controller.picUrl =
                                  controller.picUrl;
                            } catch (e) {
                              controller.picUrl =
                                  controller.currentUser!.pic;
                            }
                            await controller.updateCurrentUser();
                            setState(() {
                              _isLoading = false;
                            });

                             */
                          },
                          //onPressed: (){},
                          height: 40.0,
                          child: Text(
                            'upload image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */



/*

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectImageViewModel>(
      init: SelectImageViewModel(),
      builder: (controller) => Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Edit Profile'),
              backgroundColor: defualtColor,
              actions: [
                _isLoading
                    ? CircularProgressIndicator()
                    : GetBuilder<SettingModel>(
                  init: SettingModel(),
                  builder:(controller2) => TextButton(
                    child: Text(
                      'update',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          await controller.uploadImageToFirebase();
                          controller2.picUrl = controller.picUrl;
                        } catch (e) {
                          print(e.toString());
                          controller2.picUrl = controller2.currentUser!.pic;
                        }
                        try{
                          await controller.uploadCoverImageToFirebase();
                          controller2.coverUrl = controller.coverUrl;
                        }catch(e){
                          print(e.toString());
                          controller2.coverUrl = controller2.currentUser!.cover;
                        }
                        _formKey.currentState!.save();
                        await controller2.updateCurrentUser();
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 15.0.w,
                ),
              ]),
          body: SingleChildScrollView(
            child: GetBuilder<SettingModel>(
              init: SettingModel(),
              builder:(controller6)=> Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Column(
                  children: [
                    Container(
                      height: 190.0.h,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  Container(
                                    height: 140.0.h,
                                    width: double.infinity,
                                    decoration: controller.imageCoverFile != null ?  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0).w,
                                        topRight: Radius.circular(4.0).w,
                                      ),
                                      image: DecorationImage(
                                        image: FileImage(controller.imageCoverFile!),
                                        fit: BoxFit.cover,
                                      ),
                                    ) :  BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0).w,
                                        topRight: Radius.circular(4.0).w,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://png.pngtree.com/thumb_back/fh260/background/20200630/pngtree-neon-double-color-futuristic-frame-colorful-background-image_340466.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: Container(
                                            child: Text(
                                              'Choose option',
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                color: defualtColor,
                                              ),
                                            ),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Divider(
                                                height: 1.h,
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  try {
                                                    await controller.cameraCoverImage();
                                                    Get.back();
                                                  } catch (error) {
                                                    Get.back();
                                                  }
                                                },
                                                title: Container(
                                                  child: Text(
                                                    'Camera',
                                                  ),
                                                ),
                                                leading: Icon(
                                                  Icons.camera,
                                                  color: defualtColor,
                                                ),
                                              ),
                                              Divider(
                                                height: 1.h,
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  try {
                                                    await controller.galleryCoverImage();
                                                    Get.back();
                                                  } catch (error) {
                                                    Get.back();
                                                  }
                                                },
                                                title: Container(
                                                  child: Text(
                                                    'Gallery',
                                                  ),
                                                ),
                                                leading: Icon(
                                                  Icons.account_box,
                                                  color: defualtColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: defualtColor,
                                      radius: 20.0.r,
                                      child: Icon(
                                        Icons.camera,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                ]),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 63.0.r,
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0.r,
                                  backgroundImage: NetworkImage(
                                      'https://t4.ftcdn.net/jpg/02/14/74/61/240_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                                  foregroundImage: controller.imageFile != null
                                      ? FileImage(controller.imageFile!)
                                      : null,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Container(
                                        child: Text(
                                          'Choose option',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: defualtColor,
                                          ),
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Divider(
                                            height: 1.h,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              try {
                                                await controller.cameraImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            },
                                            title: Container(
                                              child: Text(
                                                'Camera',
                                              ),
                                            ),
                                            leading: Icon(
                                              Icons.camera,
                                              color: defualtColor,
                                            ),
                                          ),
                                          Divider(
                                            height: 1.h,
                                          ),
                                          ListTile(
                                            onTap: () async {
                                              try {
                                                await controller.galleryImage();
                                                Get.back();
                                              } catch (error) {
                                                Get.back();
                                              }
                                            },
                                            title: Container(
                                              child: Text(
                                                'Gallery',
                                              ),
                                            ),
                                            leading: Icon(
                                              Icons.account_box,
                                              color: defualtColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: CircleAvatar(
                                  backgroundColor: defualtColor,
                                  radius: 20.0.r,
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: defualtColor,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () async{
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    try {
                                      await controller.uploadImageToFirebase();
                                      controller6.picUrl =
                                          controller.picUrl;
                                    } catch (e) {
                                      controller6.picUrl =
                                          controller6.currentUser!.pic;
                                    }
                                    await controller6.updateCurrentUser();
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },


                                  //  onPressed: (){},
                                  height: 40.0.h,
                                  child: Text(
                                    'upload profile',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: defualtColor,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ).w,
                                ),
                                child: MaterialButton(
                                  onPressed: () async{
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    try {
                                      await controller.uploadCoverImageToFirebase();
                                      controller6.coverUrl =
                                          controller.coverUrl;
                                    } catch (e) {
                                      controller6.coverUrl =
                                          controller6.currentUser!.cover;
                                    }
                                    await controller6.updateCurrentUser();
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  },
                                  height: 40.0.h,
                                  child: Text(
                                    'upload cover',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0.h,
                    ),
                    TextFormField(
                      cursorColor: defualtColor,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: defualtColor,
                        ),
                        hintText: controller6.currentUser!.name,
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: defualtColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4)
                          return 'Please enter valid name.';
                      },
                      //initialValue: Get.find<SettingModel>().currentUser!.name,
                      onSaved: (value) {
                        controller6.name = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    TextFormField(
                      cursorColor: defualtColor,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                        ),
                        hintText: controller6.currentUser!.email,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: defualtColor,
                        ),
                        // hintText: hintText,
                        prefixIcon: Icon(
                          Icons.email,
                          color: defualtColor,
                        ),
                      ),
                      // initialValue: Get.find<SettingModel>().currentUser!.email,
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Please enter valid email address.';
                      },
                      onSaved: (value) {
                        controller6.email = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    TextFormField(
                      cursorColor: defualtColor,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: defualtColor, width: 2.0.w),
                        ),
                        labelText: 'Phone',
                        labelStyle: TextStyle(
                          color: defualtColor,
                        ),
                        // hintText: hintText,
                        prefixIcon: Icon(
                          Icons.call,
                          color: defualtColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 13)
                          return 'Please enter valid password with at least 12 characters.';
                      },
                      onSaved: (value) {
                        controller6.phone = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 */