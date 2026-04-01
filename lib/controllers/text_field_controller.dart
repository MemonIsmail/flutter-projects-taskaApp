import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController{

  RxBool isUsernameFocused = false.obs;
  RxBool isPasswordFocused = false.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    usernameFocusNode.addListener((){
      isUsernameFocused.value = usernameFocusNode.hasFocus;
    });

    passwordFocusNode.addListener((){
      isPasswordFocused.value = passwordFocusNode.hasFocus;
    });
  }

}