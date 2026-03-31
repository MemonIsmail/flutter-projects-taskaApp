import 'package:get/get.dart';
import 'package:taska_app/Controllers/splash_screen_controller.dart';
import 'package:taska_app/controllers/login_screen_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.lazyPut(() => LoginScreenController());
  }
}