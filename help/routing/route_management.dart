import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';
import 'package:getx_implementation/routing/screens_bindings.dart';
import 'package:getx_implementation/screens/appointment_screen.dart';
import 'package:getx_implementation/screens/login_screen.dart';
import 'package:getx_implementation/screens/onboarding_screen.dart';
import 'package:getx_implementation/screens/profile_screen.dart';
import 'package:getx_implementation/screens/search_screen.dart';
import 'package:getx_implementation/screens/sign_up_screen.dart';

class RouteManagement {
  static List<GetPage> getPages(){
    return [
      GetPage(
          name: kOnboardingScreenRoute,
          page: () => OnboardingScreen(),
          binding: ScreensBindings(),
      ),

      GetPage(
          name: kSignUpScreenRoute,
          page: () => SignUpScreen(),
          binding: ScreensBindings(),
      ),

      GetPage(
          name: kLoginScreenRoute,
          page: () => LoginScreen(),
          binding: ScreensBindings(),
      ),

      GetPage(
          name: kSearchScreenRoute,
          page: () => SearchScreen(),
          binding: ScreensBindings(),
      ),

      GetPage(
          name: kAppointmentScreenRoute,
          page: () => AppointmentScreen(),
          binding: ScreensBindings(),
      ),

      GetPage(
          name: kProfileScreenRoute,
          page: () => ProfileScreen(),
          binding: ScreensBindings(),
      ),
    ];
  }
}