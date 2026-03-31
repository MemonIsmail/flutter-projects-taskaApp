import 'package:getx_implementation/model/reviews.dart';

class UserModel{
  String name= "";
  String email = "";
  String profession= "";
  String image = "";
  int noOfPatients = 0;
  double rating = 0;
  int followers = 0;
  int following = 0;
  String mobile = '';
  String twitter = '';
  String behance = '';
  String facebook = '';
  List<Reviews> reviewsReceived = [];

  UserModel.empty();
  UserModel({
    required this.name,
    required this.email,
    required this.profession,
    required this.image,
    required this.noOfPatients,
    required this.rating,
    required this.followers,
    required this.following,
    required this.facebook,
    required this.behance,
    required this.mobile,
    required this.twitter,
  });

  String printValues(){
    return "Name inside model is $name, and user has $rating ratings";
  }

  @override
  String toString() {
    return 'UserModel"s name: $name and email: $email';
  }
}