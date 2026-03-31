import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';

class CustomNavigationController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt currentIndex = 0.obs;
  RxBool isTapped = false.obs;

  Future<void> onItemSelected(int index) async {
    isTapped.value = true;
    currentIndex.value = index;
    
    Future.delayed(Duration(milliseconds: 500)).then((_){
      isTapped.value = false;
    });

    if((index == 0 || index == 1) && Get.currentRoute != kSearchScreenRoute){
      await Get.offNamed(kSearchScreenRoute);
    }
    else if(index == 2 && Get.currentRoute != kAppointmentScreenRoute){
      await Get.offNamedUntil(kAppointmentScreenRoute, (route) => route.isFirst);
    }
    else if(index == 3 && Get.currentRoute != kProfileScreenRoute){
      await Get.offNamedUntil(kProfileScreenRoute, (route) => route.isFirst);
    }
  }
}