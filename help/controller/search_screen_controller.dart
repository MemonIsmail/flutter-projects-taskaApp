import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/investigations.dart';

class SearchScreenController extends GetxController {

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final Investigations investigation1 = Investigations(
      title: 'What is Replication crisis',
      subTitle: 'This article will look at this subject, providing a brief overview of this subject.',
      image: 'assets/download.jpg'
  );

  final Investigations investigation2 = Investigations(
      title: 'cardiology and Pregnancy',
      subTitle: 'Approximately 86% of practicing cardiologists treat pregnant patients every year, yet roughly half report a lack of confidence in prescribing cardiovascular medications to this population.',
      image: 'assets/heart.png'
  );

  final Investigations investigation3 = Investigations(
      title: 'Mental Health and Behaviour',
      subTitle: 'Studying the relationship between physical activity and happiness, or identifying trends in burnout and stress.',
      image: 'assets/mental_health.jpg'
  );
}