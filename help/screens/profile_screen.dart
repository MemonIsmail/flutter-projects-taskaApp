import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller/profile_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/screens/widgets.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        globalKey: controller.globalKey,
        backgroundColor: ScreenColors.bodyBackgroundColor,
        body: _getBody(context),
        showNavBar: true,
    );
  }
  Widget _getBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ScreenColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/profile.png',
                              height: 70,
                              width: 70,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx((){
                            return CustomText(
                              text: controller.name.value,
                              fontWeight: FontWeight.bold,
                            );
                          }
                          ),
                          CustomText(
                            text: 'Flutter Developer',
                            textColor: ScreenColors.darkGrey3,
                            fontSize: 11,
                          ),
                          Row(
                            children: [
                              Card(
                                elevation: 0.0,
                                color: ScreenColors.lightBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: ScreenColors.kIndigo,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Patients',
                                    textColor: ScreenColors.darkGrey2,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    textHeight: 1.1,
                                  ),
                                  CustomText(
                                    text: '${controller.charolleteUser.noOfPatients}+',
                                    fontSize: 10,
                                    textHeight: 1.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ScreenColors.kWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: '275',
                              textHeight: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: '234',
                              textHeight: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: '123',
                              textHeight: 1.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Articles',
                            fontSize: 12,
                            textColor: ScreenColors.darkGrey2,
                          ),
                          CustomText(
                            text: 'Following',
                            fontSize: 12,
                            textColor: ScreenColors.darkGrey2,
                          ),
                          CustomText(
                            text: 'Followers',
                            fontSize: 12,
                            textColor: ScreenColors.darkGrey2,
                          ),
                        ],
                      ),
                      SizedBox(height: 19,),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: ScreenColors.kIndigo,
                                ),
                                child: CustomText(
                                  text: 'Follow',
                                  fontWeight: FontWeight.w400,
                                  textColor: ScreenColors.kWhiteColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: OutlinedButton(
                                  onPressed: (){

                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      side: BorderSide(
                                        color: ScreenColors.kIndigo,
                                        width: 1.5,
                                      )
                                  ),
                                  child: CustomText(
                                    text: 'Message',
                                    fontWeight: FontWeight.w400,
                                    textColor: ScreenColors.kIndigo,
                                  ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  color: ScreenColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/rating.png'),
                          ),
                          SizedBox(width: 5,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Rating',
                                fontSize: 11,
                                textColor: ScreenColors.darkGrey2,
                                textHeight: 1.1,
                              ),
                              CustomText(
                                text: '4.78 out of 5',
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                textHeight: 1.1,
                              ),
                            ],
                          ),
                          SizedBox(width: 63),
                          SizedBox(
                            height: 30,
                            width: 102,
                            child: ElevatedButton(
                                onPressed:(){} ,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ScreenColors.kIndigo,
                                  foregroundColor: ScreenColors.kWhiteColor,
                                ),
                                child: CustomText(
                                  text: 'See all >',
                                  fontSize: 12,
                                  textColor: ScreenColors.kWhiteColor,
                                ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: ScreenColors.dividerGrey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      for(int i=0; i<controller.charolleteUser.reviewsReceived.length; i++)
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      controller.charolleteUser.reviewsReceived[i]
                                          .image),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.charolleteUser.reviewsReceived[i]
                                            .name,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Text(
                                        controller.charolleteUser.reviewsReceived[i]
                                            .review,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: ScreenColors.darkGrey3,
                                          height: 1.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: ScreenColors.dividerGrey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        controller.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: ScreenColors.kIndigo,
                        foregroundColor: ScreenColors.kWhiteColor,
                      ),
                      child: Text('Log Out'),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}

