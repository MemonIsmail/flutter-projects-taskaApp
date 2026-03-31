import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/controller/search_screen_controller.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/screens/widgets.dart';


class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: ScreenColors.bodyBackgroundColor,
      globalKey: controller.globalKey,
      body: _getBody(),
      showNavBar: true,
    );
  }

  Widget _getBody(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/search_image.jpeg',
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 23,
                    right: 25,
                    child: CustomTextField(
                      hintText: 'Search',
                      prefIcon: Icons.search,
                      borderRadius: 14,
                      borderWidth: 1.5,
                      borderColor: ScreenColors.kIndigo,
                      fill: true,
                      filColor: ScreenColors.kWhiteColor
                    )
                ),
              ],
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _section(text: 'Doctors', icon: Icons.person_add_alt_rounded, iconColor: ScreenColors.kDeepOrange),
                  _section(text: 'Pharmacy', icon: Icons.medication, iconColor: ScreenColors.kIndigo),
                  _section(text: 'Hospitals', icon: Icons.medical_services, iconColor: ScreenColors.darkGreen),
                ],
              ),
            ),
            SizedBox(height: 20,),
            CustomText(
              text: 'Your Symptoms',
              textColor: ScreenColors.lightBlack,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: [
                      _symptom(text: 'Headache', image: 'assets/headache_emoji2.png',),
                      SizedBox(width: 5,),
                      _symptom(text: 'Nausea', image: 'assets/nausea.png', ),
                      SizedBox(width: 5,),
                      _symptom(text: 'Fever', image: 'assets/fever.png', ),
                      SizedBox(width: 5,),
                      _symptom(text: 'Sleepiness', image: 'assets/sleepy.png',),
                    ]
                ),
              ),
            ),
            SizedBox(height: 20,),
            CustomText(
              text: 'New investigations',
              textColor: ScreenColors.lightBlack,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            Column(
              children: [
                _investigation(
                  title: controller.investigation1.title,
                  subTitle: controller.investigation1.subTitle,
                  image: controller.investigation1.image,
                ),
                SizedBox(height: 10,),
                _investigation(
                  title: controller.investigation2.title,
                  subTitle: controller.investigation2.subTitle,
                  image: controller.investigation2.image,

                ),
                SizedBox(height: 10,),
                _investigation(
                  title: controller.investigation3.title,
                  subTitle: controller.investigation3.subTitle,
                  image: controller.investigation3.image,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _investigation({required String image,required String title, required String subTitle,}){
    return Card(
      elevation: 0.0,
      color: ScreenColors.kWhiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  width: 75,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),

                    CustomText(
                      text: subTitle,
                      textColor: ScreenColors.darkGrey3,
                      fontSize: 12,
                      textHeight: 1.1
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _section({required IconData icon, required Color iconColor, required String text}){
    return SizedBox(
      height: 90,
      width: 105,
      child: Container(
        decoration: BoxDecoration(
          color: iconColor.withAlpha(40),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(5),

        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 35,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ScreenColors.lightBlack,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _symptom({required String image, required String text}){
    return Container(
      decoration: BoxDecoration(
        color: ScreenColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15)
      ),
      margin: EdgeInsets.all(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15,8,15,8),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 30,
                height: 30,
              ),
              SizedBox(width: 8,),
              CustomText(
                text: text,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
