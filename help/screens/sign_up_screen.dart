import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller/sign_up_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/screens/widgets.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      globalKey: controller.globalKey,
      body: _getBody(),
      showAppBar: false,
      showNavBar: false,
      showDrawer: false,
    );
  }

  Widget _getBody(){
    return Padding(
      padding: const EdgeInsets.all(22),

      child: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 40),
            headingText(text: 'Create an Account'),

            SizedBox(height: 25),
            labelText(text: 'Name'),

            SizedBox(height: 8),
            Obx(() => CustomTextField(
              textEditingController: controller.nameController,
              hintText: 'John Doe',
              onChanged: (value){
                controller.validate();
              },
              errorText: controller.nameError.value,
            ),
            ),

            SizedBox(height: 5),
            labelText(text: 'Email address'),

            SizedBox(height: 8),
            Obx( ()=> CustomTextField(
              hintText: 'hello@example.com',
              textEditingController: controller.emailController,
              onChanged:(value){
                controller.validate();
              },
              errorText:controller.emailError.value,
            ),
            ),

            SizedBox(height: 5),
            labelText(text: 'Password'),

            SizedBox(height: 8),

            Obx(() {
              return CustomTextField(
                textEditingController: controller.passwordController,
                hintText: 'Password',
                obscureText: controller.showPassword.value,
                errorText: controller.passwordError.value,
                onChanged: (value){
                  controller.validate();
                },
                suffIcon: controller.showPassword.value ? Icons.visibility_off : Icons.visibility_rounded,
                onPressed: () => controller.showPassword.toggle(),
              );
            }),

            Row(
              children: [
                CustomText(
                  text: 'By continuing, you agree to our',
                  textColor: ScreenColors.lightBlack,
                ),

                CreateAndSignInTextButton(
                  text: 'terms of service',
                  onPressed: (){
                  },
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: LoginAndSignUpButtons(
                    text: 'Sign Up',
                    onPressed: () => controller.signup(),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            expandedDividerText(text: 'or'),

            SizedBox(height: 30),
            googleButton(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Already have an account?',
                  textColor: ScreenColors.lightBlack2,
                ),
                CreateAndSignInTextButton(
                    text: 'Sign in here',
                    onPressed: () {
                      controller.signIn();
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
