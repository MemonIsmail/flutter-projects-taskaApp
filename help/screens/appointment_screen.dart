import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller/appointment_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/screens/widgets.dart';

class AppointmentScreen extends GetView<AppointmentScreenController> {

  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ScreenColors.bodyBackgroundColor,
      globalKey: controller.globalKey,
      body: getBody(context),
      showNavBar: true,
    );
  }
  Widget getBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: controller.formattedDate,
                      textColor: ScreenColors.kGrey,
                      fontSize: 11,
                    ),

                    CustomText(
                      text: 'Today',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      textHeight: 1.1,
                    )
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ScreenColors.kIndigo,
                      foregroundColor: ScreenColors.kWhiteColor,
                    ),
                    child: Text('+ Add'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            SizedBox(
              height: Get.height*0.081,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    customDateCard(date: '18', day: 'Wed', select: false),
                    customDateCard(date: '19', day: 'Th', select: true ),
                    customDateCard(date: '20', day: 'Fri', select: false),
                    customDateCard(date: '21', day: 'Sa', select: false),
                    customDateCard(date: '22', day: 'Su', select: false),
                    customDateCard(date: '23', day: 'Mo', select: false),
                    customDateCard(date: '24', day: 'Tu', select: false),
                    customDateCard(date: '25', day: 'Wed', select: false),
                    customDateCard(date: '26', day: 'Th', select: false),
                    customDateCard(date: '27', day: 'Fri', select: false),
                    customDateCard(date: '28', day: 'Sat', select: false),
                    customDateCard(date: '01', day: 'Sun', select: false),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            CustomText(
              text: 'Schedule Today',
              fontSize: 12,
              fontWeight: FontWeight.w500
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      CustomText(
                          text: '9:00',
                          fontSize: 12,
                          textColor: ScreenColors.kGrey,
                      ),
                      SizedBox(height: 50,),
                      CustomText(
                        text: '10:00',
                        fontSize: 12,
                        textColor: ScreenColors.kGrey,
                      ),
                      SizedBox(height: 50,),
                      CustomText(
                        text: '11:00',
                        fontSize: 12,
                        textColor: ScreenColors.kGrey,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 6
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 12,
                            ),
                            activeTrackColor: ScreenColors.darkIndigo,
                            inactiveTrackColor: ScreenColors.kIndigo,
                            thumbColor: ScreenColors.darkIndigo,
                            overlayColor: ScreenColors.kIndigo.withAlpha(20),
                            trackShape: RoundedRectSliderTrackShape(),
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.79,
                            child: Obx((){
                              return Slider(
                                  value: controller.sliderValue.value,
                                  min: 0,
                                  max: 100,
                                  onChanged: (value){
                                    controller.changeValue(value);
                                  }
                              );
                            }
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Container(
                      decoration: BoxDecoration(
                        color: ScreenColors.lightOrange,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      margin: EdgeInsets.all(4),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: controller.danUser.profession,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  textHeight: 1.1,
                                ),
                                CustomText(
                                  text: controller.danUser.name,
                                  fontSize: 12,
                                  textHeight: 1.1,
                                  textColor: ScreenColors.darkGrey2,
                                ),
                              ],
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.36,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(controller.danUser.image),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),

            CustomText(
              text: 'Reminder',
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),

            CustomText(
              text: 'Dont forget schedule for upcoming appointment',
              fontSize: 11,
              textColor: ScreenColors.darkGrey2,
            ),
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                color: ScreenColors.kWhiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 13, left: 13, right: 13, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: controller.charolleteUser.name,
                              fontWeight: FontWeight.bold,
                            ),

                            CustomText(
                              text: controller.charolleteUser.profession,
                              fontSize: 11,
                              textColor: ScreenColors.darkGrey3,
                            ),

                            SizedBox(height: 5,),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/rating.png'),
                                ),
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
                                      text: '${controller.charolleteUser.rating} out of 5',
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      textHeight: 1.1,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            controller.charolleteUser.image,
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15,),
                    SizedBox(
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ScreenColors.lightBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: ScreenColors.kIndigo,
                                  ),
                                  SizedBox(width: 5,),
                                  CustomText(
                                    text: 'Monday, Dec 23',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: ScreenColors.kIndigo,
                                  ),
                                  CustomText(
                                    text: '12:00-13:00',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: ScreenColors.kIndigo,
                              ),
                              child: CustomText(
                                text: 'Reschedule',
                                textColor: ScreenColors.kWhiteColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                                onPressed: (){},
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
                                  text: 'Cancel',
                                  fontWeight: FontWeight.w400,
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
        
          ],
        ),
      ),
    );
  }

  Widget customDateCard({required String date, required String day, required bool select}){
    return Container(
      decoration: BoxDecoration(
        color: select
            ? ScreenColors.kBlue.withAlpha(10)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12)
      ),
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            CustomText(
              text: date,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: select
                  ? ScreenColors.darkIndigo
                  : ScreenColors.kBlackColor,
            ),

            CustomText(
              text: day,
              fontSize: select
                  ? 11
                  : 10,
              fontWeight: select
                  ? FontWeight.w500
                  : FontWeight.w400,
              textColor: select
                  ? ScreenColors.darkIndigo
                  : ScreenColors.kGrey,
            ),
          ],
        ),
      ),
    );
  }
}