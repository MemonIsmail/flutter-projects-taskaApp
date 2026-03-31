import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';
import 'package:getx_implementation/model/signup_user_model.dart';
import 'package:getx_implementation/model/user_storage.dart';

class LoginScreenController extends GetxController{

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool showPassword = true.obs;
  RxBool keepMeSignedIn = false.obs;
  final UserStorage userStorage = UserStorage();
  SignupUserModel currentUser = SignupUserModel.empty();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  bool validate(){
    emailError.value = checkEmail(email.text);
    passwordError.value = checkPassword(password.text);

    return email.text.isNotEmpty && password.text.isNotEmpty;
  }

  void checkKeep(){
    keepMeSignedIn.value = !keepMeSignedIn.value;
  }

  Future<void> onLoginPressed() async{
    if(!validate()) return;

    String? error = await userStorage.login(
      email: email.text.trim(),
      password: password.text,
    );

    if(error == 'logged in'){
      Get.offNamed(kSearchScreenRoute);
    }
    else{
      Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
  }
  void onCreatePressed(){
    Get.offNamed(kSignUpScreenRoute);
  }

  String checkEmail(String email){
    return email.isEmpty ? 'Please enter your email' : '';
  }

  String checkPassword(String password){
    return password.isEmpty ? 'Please enter your password' : '';
  }

}