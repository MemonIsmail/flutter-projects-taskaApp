import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getx_implementation/model/constants.dart';
import 'package:getx_implementation/model/user_storage.dart';

class SignUpScreenController extends GetxController {

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool showPassword = true.obs;
  RxString nameError = "".obs;
  RxString emailError = "".obs;
  RxString passwordError = "".obs;
  UserStorage userStorage = UserStorage();

  bool validate(){
    if(emailController.text.isEmpty){
      emailError.value = "Please enter your Email";
    }
    else if(!emailController.text.isEmail){
      emailError.value = "Email not valid";
    }
    else{
      emailError.value = '';
    }
    passwordError.value = checkPassword(passwordController.text);
    nameError.value = checkName(nameController.text);
    return emailController.text.isEmail && nameController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  String checkPassword(String password){
    if (password.length<8){
      return "Password should be more than 8 characters";
    } else if(password.length>50){
      return "Password should be less than 50 characters";
    } else {
      return '';
    }
  }

  String checkName(String name){
    if(name.isEmpty){
      return 'Please enter your name';
    }
    else {
      return '';
    }
  }

  Future<void> signup() async {

    if (!validate()) return;

    String? error = await userStorage.signup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    if (error == null) {
      Fluttertoast.showToast(msg: 'Account Created Successfully');
      Get.offNamed(kLoginScreenRoute);
    } else {
      Fluttertoast.showToast(msg: error);
    }
  }

  void signIn(){
    Get.offNamed(kLoginScreenRoute);
  }
}
