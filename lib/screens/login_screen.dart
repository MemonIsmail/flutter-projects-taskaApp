import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';
import 'package:taska_app/screens/widgets.dart';

class LoginScreen extends GetView<LoginScreenController>{
  bool focus = false;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/AppLogo2.png',
                  height: 90,
                  width: 90,
                ),
              ),

              SizedBox(height: Get.height*0.01,),
              CustomHeadingText(
                text: 'Taska',
                textColor: Colors.black,
                textSize: 50
              ),

              SizedBox(height: Get.height*0.01,),
              CustomHeadingText(
                text: 'Log in to your account',
                textColor: Colors.black,
                textSize: 25
              ),

              SizedBox(height: Get.height*0.04,),
              CustomTextField(
                onTap: (){
                  focus = true;
                },
                hintText: 'Username',
                prefIcon: Icons.email,
                fill: true,
                filColor: focus
                  ? kWhiteColor
                  : kLightGreyColor,
              ),
              CustomTextField(
                onTap: (){
                  focus = true;
                },
                hintText: 'Password',
                prefIcon: Icons.lock,
                suffIcon: Icons.remove_red_eye_outlined,
                fill: true,
                filColor: focus
                    ? kWhiteColor
                    : kLightGreyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}