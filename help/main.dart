import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';
import 'package:getx_implementation/routing/route_management.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kOnboardingScreenRoute,
      getPages: RouteManagement.getPages(),
    );
  }
}
