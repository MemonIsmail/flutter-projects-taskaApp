import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getx_implementation/model/signup_user_model.dart';

class UserStorage {
  static const String allUsersKey = 'all_users';
  static const String loginUserKey = 'login_user_key';


  Future<List<SignupUserModel>> getUsers() async {
    String response = await getData(allUsersKey);
    List<SignupUserModel> userList = [];

    if(response.isNotEmpty){
      List<dynamic> jsonList = jsonDecode(response);
      for(dynamic user in jsonList){
        userList.add(SignupUserModel.fromJson(user));
      }
    }
    return userList;
  }

  Future<String> getData(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    return jsonString ?? "";
  }


  Future<String?> signup({
    required String name,
    required String email,
    required String password,
    }) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<SignupUserModel> userList = await getUsers();

    for(SignupUserModel user in userList){
      if(user.email.toLowerCase() == email.trim().toLowerCase()){
        return 'This email is already registered, please log in.';
      }
    }

    SignupUserModel newUser = SignupUserModel(
        name: name.trim(),
        email: email.trim().toLowerCase(),
        password: password
    );

    userList.add(newUser);

    List<Map<String, dynamic>> maps = [];

    for(SignupUserModel user in userList){
      maps.add(user.toJson());
    }
    await prefs.setString(allUsersKey, jsonEncode(maps));
    await prefs.setString(loginUserKey, jsonEncode(newUser.toJson()));

    return null;
  }

  Future<String> login({
    required String email,
    required String password,
}) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString(allUsersKey);

    if(jsonString == null){
      return 'no accounts found, please sign in first';
    }

    List<dynamic> jsonList = jsonDecode(jsonString);
    List<SignupUserModel> userList = [];
    for(dynamic item in jsonList){
      userList.add(SignupUserModel.fromJson(item));
    }

    SignupUserModel? matchedUser;
    for(SignupUserModel user in userList){
      bool emailMatch = user.email == email.trim().toLowerCase();
      bool passMatch = user.password == password;
      if(emailMatch && passMatch){
        matchedUser = user;
        break;
      }
    }

    if(matchedUser == null){
      return 'invalid email or password';
    }

    await prefs.setString(loginUserKey, jsonEncode(matchedUser.toJson()));
    return 'logged in';
  }

  Future<SignupUserModel?> getCurrentUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString(loginUserKey);
    if(jsonString == null) return null;

    Map<String, dynamic> userMap = jsonDecode(jsonString);
    return SignupUserModel.fromJson(userMap);
  }
}