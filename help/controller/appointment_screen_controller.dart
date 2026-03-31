import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/user_model.dart';
import 'package:intl/intl.dart';

class AppointmentScreenController extends GetxController{

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  RxDouble sliderValue = 0.0.obs;
  String formattedDate = DateFormat.yMMMMd().format(DateTime.now());
  UserModel charolleteUser = UserModel(name: 'Dr. Charollete Baker', profession: 'Pediatrician',image:  'assets/Dr.png', noOfPatients: 0,rating: 4.78, email: '', followers: 0, following: 0, facebook: '',behance: '', mobile: '', twitter: '');
  UserModel danUser = UserModel(name: 'Dan Johnson', profession: 'Cardiologist', image: 'assets/Dr2.png', noOfPatients: 0, rating: 0, email: '',followers: 0, following: 0, facebook: '',behance: '', mobile: '', twitter: '');

  void changeValue(double value){
    sliderValue.value = value;
  }
}