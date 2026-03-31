import 'package:get/get.dart';
import 'package:getx_implementation/controller/onboarding_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:flutter/material.dart';
import 'package:getx_implementation/screens/widgets.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      globalKey: controller.onboardingScaffoldKey,
      body: _getBody(),
      showAppBar: false,
      showNavBar: false,
      showDrawer: false,
    );
  }

  Widget _getBody(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: Get.height*0.20),
          Image.asset(
            'assets/Onboarding.png',
          ),

          headingText(
              text: 'Welcome to the app',
              alignment: TextAlign.center,
              textFontSize: 22
          ),

          SizedBox(height: Get.height*0.005),
          CustomText(
            text: 'We\'re excited to help you book and manage',
            textAlignment: TextAlign.center,
            textColor: ScreenColors.lightBlack,
          ),

          CustomText(
            text: 'your service appointments with ease.',
            textAlignment: TextAlign.center,
            textColor: ScreenColors.lightBlack,
          ),

          SizedBox(height: Get.height*0.086,),
          LoginAndSignUpButtons(
            text: 'Login',
            onPressed: controller.onLoginPressed,
          ),

          SizedBox(height: Get.height*0.072,),
          CreateAndSignInTextButton(
            text: 'Create an account',
            onPressed: controller.onCreatePressed,
          )
        ],
      ),
    );
  }
}
