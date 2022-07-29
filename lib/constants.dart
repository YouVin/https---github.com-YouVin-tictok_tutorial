import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tictok_tutorial/controllers/auth_controller.dart';
import 'package:tictok_tutorial/views/screens/add_video_screen.dart';
import 'package:tictok_tutorial/views/screens/search_screen.dart';
import 'package:tictok_tutorial/views/screens/video_screen.dart';

//홈화면 인덱스
List pages = [
  VideoScreen(),
  const SearchScreen(),
  const AddVideoScreen(),
  Text('Messages Screen'),
  Text('Profile Screen'),
];

//Colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//CONTROLLER
var authController = AuthController.instance;
