import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/constants.dart';
import 'package:getx_implementation/model/followers.dart';
import 'package:getx_implementation/model/reviews.dart';
import 'package:getx_implementation/model/signup_user_model.dart';
import 'package:getx_implementation/model/user_model.dart';
import 'package:getx_implementation/model/user_storage.dart';

class ProfileScreenController extends GetxController{
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Rx<SignupUserModel?> currentUser = Rx<SignupUserModel?>(null);
  SignupUserModel currentUserModel = SignupUserModel.empty();
  RxString name = 'Loading...'.obs;
  UserModel charolleteUser = UserModel(name: 'Dr. Charollete Baker',email:'' ,profession: 'Pediatrician',image: 'assets/Dr.png', noOfPatients: 345, rating: 0, followers: 0, following: 0, facebook: '',behance: '', mobile: '', twitter: '');
  Followers charolleteUserFollowers = Followers(articles: 275, following: 234, followers: 123);

  @override
  void onInit(){
    super.onInit();
    addReviews();
    loadUser();
  }

  void addReviews(){
    Reviews review1 = Reviews(
        name: 'Anonymous feedback',
        image: 'assets/review1.png',
        review: 'Very competent specialist. I am very happy that there are such professional doctors. My baby is in safe hands. My child\'s health is above all'
    );
    Reviews review2 = Reviews(
        name: 'Erika Lhee',
        image: 'assets/review2.png',
        review: 'Just a wonderful doctor, very happy that she is leading our child, competent, very smart, nice'
    );
    charolleteUser.reviewsReceived.add(review1);
    charolleteUser.reviewsReceived.add(review2);
    charolleteUser.reviewsReceived.add(review1);
    charolleteUser.reviewsReceived.add(review2);
  }

  Future<void> loadUser() async{
    SignupUserModel user = await UserStorage().getCurrentUser() ?? SignupUserModel.empty();
    currentUser.value = user;
    name.value = user.name;
  }

  void logout(){
    Get.offAllNamed(kLoginScreenRoute);
  }
}