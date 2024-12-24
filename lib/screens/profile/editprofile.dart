import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_demo/screens/profile/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var formkey = GlobalKey<FormState>();
  bool showpass = false;

  File? images;

  Future pickImageFromGallery() async {
    final pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      images = File(pickedfile!.path);
    });
  }

  Future pickImageFromCamera() async {
    final pickedfile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      images = File(pickedfile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('EditProfile'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  images == null
                      ? Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/profileAddSample.png')),
                          ),

                          // child: images == null
                          //     ? Image.asset('assets/images/profileAddSample.png')
                          //     : Image.file(images!),
                        )
                      : Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover, image: FileImage(images!)),
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.red[900],
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          'Choose Photo From',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {
                                                pickImageFromCamera();
                                              },
                                              label: const Text('Camera'),
                                              icon: const Icon(Icons.camera),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {
                                                pickImageFromGallery();
                                              },
                                              label: const Text('Gallery'),
                                              icon: const Icon(Icons.photo),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person)),
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email)),
              ),
              TextFormField(
                obscureText: !showpass,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      icon: Icon(showpass == false
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              TextFormField(
                obscureText: !showpass,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                      icon: Icon(showpass == false
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  labelText: 'Confirm Password',
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red[900],
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ));
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red[900],
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
