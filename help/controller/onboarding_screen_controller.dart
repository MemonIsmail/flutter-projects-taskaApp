import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';

class OnboardingScreenController extends GetxController{

  GlobalKey<ScaffoldState> onboardingScaffoldKey = GlobalKey<ScaffoldState>();

  void onLoginPressed() async{
    Get.offNamed(kLoginScreenRoute);
  }

  void onCreatePressed() async{
    Get.offNamed(kSignUpScreenRoute);
  }
}