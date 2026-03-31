import 'package:get/get.dart';
import 'package:getx_implementation/controller/appointment_screen_controller.dart';
import 'package:getx_implementation/controller/login_screen_controller.dart';
import 'package:getx_implementation/controller/onboarding_screen_controller.dart';
import 'package:getx_implementation/controller/profile_screen_controller.dart';
import 'package:getx_implementation/controller/search_screen_controller.dart';
import 'package:getx_implementation/controller/sign_up_screen_controller.dart';
import 'package:getx_implementation/controller/custom_navigation_controller.dart';

class ScreensBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => SearchScreenController());
    Get.lazyPut(() => AppointmentScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => CustomNavigationController());
  }

}