import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller/login_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/screens/widgets.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        globalKey: controller.globalKey,
        showAppBar: false,
        showNavBar: false,
        showDrawer: false,
        body: _getBody()
    );
  }

  Widget _getBody(){
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height*0.20),
              headingText(text: 'Login'),

              SizedBox(height: Get.height*0.01),
              CustomText(
                text: 'Welcome back to the app',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                textColor: ScreenColors.darkGrey3,
              ),

              SizedBox(height: Get.height*0.045),
              labelText(text: 'Email address'),

              SizedBox(height: Get.height*0.015),
              Obx(() =>
                  CustomTextField(
                  hintText: 'hello@example.com',
                  textEditingController: controller.email,
                  onChanged: (value){
                    controller.validate();
                  },
                  errorText: controller.emailError.value,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  labelText(text: 'Password'),
                  CreateAndSignInTextButton(text: 'Forgot Password?'),
                ],
              ),

              Obx((){
                return CustomTextField(
                  textEditingController: controller.password,
                  hintText: 'Password',
                  obscureText: controller.showPassword.value,
                  suffIcon: controller.showPassword.value ? Icons.visibility_off:Icons.visibility_rounded,
                  onPressed: () => controller.showPassword.toggle(),
                  onChanged: (value){
                    controller.validate();
                  },
                  errorText: controller.passwordError.value,
                );
              }
              ),

              SizedBox(height: Get.height*0.03,),
              Row(
                  children: [
                    Obx(()
                    => Checkbox(
                      value: controller.keepMeSignedIn.value,
                      onChanged: (value){
                        return controller.checkKeep();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      activeColor: ScreenColors.kDarkBlue2,
                    )),
                    const CustomText(text: 'Keep me signed in'),
                  ]
              ),
              Row(
                children: [
                  Expanded(
                    child: LoginAndSignUpButtons(
                      text: 'Login',
                      onPressed: () => controller.onLoginPressed(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Get.height*0.045),
              expandedDividerText(text: 'or sign in with'),

              SizedBox(height: Get.height*0.045),
              googleButton(),

              SizedBox(height: Get.height*0.045),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreateAndSignInTextButton(
                    text: 'Create an Account',
                    onPressed: (){
                      controller.onCreatePressed();
                    },
                  ),
                ],
              )
            ]
        ),
      ),
    );
  }
}
