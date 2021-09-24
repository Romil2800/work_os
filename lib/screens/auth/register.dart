import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work_os/constants/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late TextEditingController _emailTextController = TextEditingController();
  late TextEditingController _passTextController = TextEditingController();
  late TextEditingController _positionCPTextController =
      TextEditingController();
  late TextEditingController _phoneNumberTextController =
      TextEditingController();
  late TextEditingController _fullNameTextController = TextEditingController();
  bool _obsecureText = true;
  final _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _phoneNumberFocusNode = FocusNode();
  FocusNode _positionCPFocusNode = FocusNode();

  @override
  void dispose() {
    _animationController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _fullNameTextController.dispose();
    _positionCPTextController.dispose();
    _phoneNumberTextController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _positionCPFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void _submitFormSignUp() async {
    final isValid = _signUpFormKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _auth.createUserWithEmailAndPassword(
            email: _emailTextController.text.trim().toLowerCase(),
            password: _passTextController.text.trim());
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(error.toString());
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/158/158730.png',
                height: 20,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Error Occured',
                ),
              )
            ],
          ),
          content: Text(
            error,
            style: TextStyle(
              color: Constants.darkBlue,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
            
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: AppBar(title: Text('Login')),
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://media.istockphoto.com/photos/businesswoman-using-computer-in-dark-office-picture-id557608443?k=6&m=557608443&s=612x612&w=0&h=fWWESl6nk7T6ufo4sRjRBSeSiaiVYAzVrY-CLlfMptM=",
            placeholder: (context, url) => Image.asset(
              'assets/images/wallpaper.jpg',
              fit: BoxFit.fill,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value, 0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(text: '  '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        text: 'Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => FocusScope.of(context)
                                  .requestFocus(_emailFocusNode),
                              keyboardType: TextInputType.name,
                              controller: _fullNameTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Thus field is missing';
                                }
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: size.width * 0.24,
                                  width: size.width * 0.24,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: imageFile == null
                                        ? Image.network(
                                            'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                                            fit: BoxFit.fill)
                                        : Image.file(imageFile!,
                                            fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    _showImageDialog();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        imageFile == null
                                            ? Icons.add_a_photo
                                            : Icons.edit_outlined,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextController,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_phoneNumberFocusNode),
                        focusNode: _passwordFocusNode,
                        obscureText: _obsecureText,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passTextController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Please enter a valid password';
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obsecureText = !_obsecureText;
                              });
                            },
                            child: Icon(
                              _obsecureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_positionCPFocusNode),
                        keyboardType: TextInputType.number,
                        focusNode: _phoneNumberFocusNode,
                        controller: _phoneNumberTextController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Thus field is missing';
                          }
                        },
                        onChanged: (value) {
                          // print(_phoneNumberTextController.text);
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _showTaskCategotriesDialog(size: size);
                        },
                        child: TextFormField(
                          enabled: false,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () => _submitFormSignUp(),
                          focusNode: _positionCPFocusNode,
                          keyboardType: TextInputType.name,
                          controller: _positionCPTextController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field is missing';
                            }
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Position of the company',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                _isLoading
                    ? Center(
                        child: Container(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : MaterialButton(
                        onPressed: _submitFormSignUp,
                        color: Colors.pink.shade700,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.person_add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  _getFromCamera();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.camera,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      'Camera',
                      style: TextStyle(color: Colors.purple),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _getFromGallery();
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.image,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: TextStyle(color: Colors.purple),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
    // setState(() {
    //   imageFile = File(pickedFile!.path);
    // });
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
    // setState(() {
    //   imageFile = File(pickedFile!.path);
    // });
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
        sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);
    if (croppedImage != null) {
      setState(() {
        imageFile = croppedImage;
      });
    }
  }

  void _showTaskCategotriesDialog({required Size size}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Choose your Jobs',
            style: TextStyle(fontSize: 20, color: Colors.pink.shade800),
          ),
          content: Container(
            width: size.width * 0.9,
            child: ListView.builder(
                itemCount: Constants.jobsList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _positionCPTextController.text =
                            Constants.jobsList[index];
                      });
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Colors.red.shade200,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Constants.jobsList[index],
                            style: TextStyle(
                                color: Constants.darkBlue,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
