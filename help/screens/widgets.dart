import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_implementation/model/signup_user_model.dart';
import 'package:getx_implementation/screens/screen_colors.dart';
import 'package:getx_implementation/model/user_storage.dart';
import 'package:getx_implementation/controller/custom_navigation_controller.dart';

Widget headingText({
  required String text,
  TextAlign alignment = TextAlign.start,
  double textFontSize = 25
}){
  return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontSize: textFontSize,
          fontWeight: FontWeight.w700
      ),
  );
}

Widget labelText({required String text}){
  return Text(
    text,
    style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: ScreenColors.kBlackColor,
    ),
  );
}

Widget loginAndSignUpButton({required String text}){
  return ElevatedButton(
      onPressed:() {

      },
      style: ElevatedButton.styleFrom(
          backgroundColor: ScreenColors.kDarkBlue2,
          foregroundColor: ScreenColors.kWhiteColor,
      ),
      child: Text(text)
  );
}

Widget googleButton(){
  return ElevatedButton(
      onPressed:() {},
      style: ElevatedButton.styleFrom(
          backgroundColor: ScreenColors.dividerGrey,
          foregroundColor: ScreenColors.lightBlack2
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/google-icon.svg',
            height: 20,
          ),
          SizedBox(width: 15,),
          Text(
            'Continue with Google',
            style: TextStyle(
                color: ScreenColors.lightBlack,
            ),
          )
        ],
      )
  );
}

Widget expandedDividerText({required String text}){
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: ScreenColors.dividerGrey,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          text,
          style: TextStyle(
              color: ScreenColors.kGrey,
              fontSize: 14
          ),
        ),
      ),
      Expanded(
        child: Divider(
          color: ScreenColors.dividerGrey,
          thickness: 1,
        ),
      ),
    ],
  );
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool obscureText;
  final IconData? suffIcon;
  final IconData? prefIcon;
  final Function()? onPressed;
  final String hintText;
  final String errorText;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final bool fill;
  final Color filColor;
  final Color borderColor;
  final double borderWidth;
  const CustomTextField({
    super.key,
    this.textEditingController,
    this.onChanged,
    required this.hintText,
    this.errorText = '',
    this.obscureText=false,
    this.suffIcon,
    this.onPressed,
    this.prefIcon,
    this.borderRadius = 5,
    this.borderWidth = 0,
    this.borderColor = ScreenColors.kGrey,
    this.fill = false,
    this.filColor = ScreenColors.kWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: ScreenColors.kGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              suffixIcon: IconButton(
                  icon: Icon(suffIcon),
                  onPressed:onPressed
              ),
              suffixIconColor: ScreenColors.kGrey,
              prefixIcon: prefIcon != null ? Icon(prefIcon) : null,
              prefixIconConstraints: prefIcon == null
                ? const BoxConstraints()
                : null,
              prefixIconColor: ScreenColors.kGrey,
              filled: fill,
              fillColor: filColor,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: borderWidth,
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: borderColor,
                      width: borderWidth,
                  )
              )
          ),
          onChanged: onChanged,
        ),
        Text(errorText,style: TextStyle(color: ScreenColors.kRedColor),),
      ],
    );
  }
}

class LoginAndSignUpButtons extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const LoginAndSignUpButtons({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: ScreenColors.kDarkBlue2,
            foregroundColor: ScreenColors.kWhiteColor,
        ),
        child: Text(text)
    );
  }
}

class CreateAndSignInTextButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const CreateAndSignInTextButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(4)
      ),
        onPressed: onPressed,
        child: Text(
            text,
            style: TextStyle(
                color: ScreenColors.kDarkBlue2,
                fontWeight: FontWeight.w500,
            ),
        )
    );
  }
}

class CustomScaffold extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final Color backgroundColor;
  final Widget body;
  final bool showDrawer;
  final bool showAppBar;
  final bool showNavBar;
  const CustomScaffold({super.key, required this.globalKey, this.backgroundColor = ScreenColors.kWhiteColor, required this.body, this.showDrawer = true, this.showAppBar = true, this.showNavBar = false});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.globalKey,
      appBar: widget.showAppBar ? CustomAppBar(globalKey: widget.globalKey,) : null,
      backgroundColor: widget.backgroundColor,
      body: widget.body,
      drawer: widget.showDrawer ? CustomDrawer() : null,
      bottomNavigationBar: widget.showNavBar ? CustomNavigationBar() : null,
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  SignupUserModel? currentUser;
  String name = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }
  @override
  Widget build(BuildContext context) {
    if(currentUser == null){
      name = 'Loading...';
    }
    else{
      name = currentUser!.name;
    }
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/blueBackground2.jpeg',
                  height: 203,
                  width: 406,
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(color: ScreenColors.kWhiteColor, width: 4)
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              color: ScreenColors.kWhiteColor,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'Flutter Developer',
                          style: TextStyle(
                              color: ScreenColors.kWhiteColor,
                              fontSize: 13
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _section(title: 'All Inboxes', noOfMessages: '15', icon: Icons.mail_lock_outlined ),
                  _drawerDivider(),
                  _section(title: 'Primary', noOfMessages: '15', icon: Icons.email),
                  ListTile(
                    leading: Icon(
                      Icons.group,
                      color: ScreenColors.darkGrey1,
                    ),
                    title: Text(
                      'Social',
                      style: TextStyle(
                          fontSize: 14,
                          color: ScreenColors.darkGrey2,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: ScreenColors.lightBlue2,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                        child: Text(
                          '14 new',
                          style: TextStyle(
                            color: ScreenColors.darkGrey3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.sell,
                      color: ScreenColors.darkGrey1,
                    ),
                    title: Text(
                      'Promotions',
                      style: TextStyle(
                          fontSize: 14,
                          color: ScreenColors.darkGrey2,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: ScreenColors.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        child: Text(
                          '99+ new',
                          style: TextStyle(
                            color: ScreenColors.darkGrey3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _drawerDivider(),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'All labels',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                  _section(title: 'Starred', noOfMessages: '', icon: Icons.star),
                  _section(title: 'Important', noOfMessages: '1', icon: Icons.label_important),
                  _section(title: 'Sent', noOfMessages: '', icon: Icons.send),
                  _section(title: 'Outbox', noOfMessages: '', icon: Icons.outbox),
                  _section(title: 'Drafts', noOfMessages: '', icon: Icons.insert_drive_file),
                  _section(title: 'All emails', noOfMessages: '99+', icon: Icons.email_outlined),
                  _section(title: 'Spam', noOfMessages: '99+', icon: Icons.report),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _section({required String title, required String noOfMessages, IconData? icon}){
    return ListTile(
      leading: Icon(
        icon,
        color: ScreenColors.darkGrey1,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            color: ScreenColors.darkGrey2,
            fontWeight: FontWeight.w500
        ),
      ),
      trailing: Text(
        noOfMessages,
        style: TextStyle(
          color: ScreenColors.kGrey,
        ),
      ),
    );
  }

  Widget _drawerDivider(){
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Divider(
              color: ScreenColors.lightGrey,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }

  Future<void> loadUser() async{
    SignupUserModel? user = await UserStorage().getCurrentUser();
    setState(() {
      currentUser = user;
    });
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  CustomAppBar({super.key, required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ScreenColors.bodyBackgroundColor,
      leading: GestureDetector(
        onTap: (){
          globalKey.currentState?.openDrawer();
        },
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ScreenColors.kWhiteColor,
          ),
          child: Icon(
            Icons.menu,
            color: ScreenColors.kIndigo,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomText extends StatelessWidget {
  final String text;
  final TextAlign textAlignment;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double textHeight;
  const CustomText({super.key, required this.text, this.textAlignment = TextAlign.start, this.textColor = ScreenColors.kBlackColor, this.fontSize = 13, this.fontWeight = FontWeight.w400, this.textHeight = 0.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlignment,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: textHeight,
      ),
    );
  }
}

class CustomNavigationBar extends GetView<CustomNavigationController> {

  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: Obx(() =>
          BottomAppBar(
            height: 75,
            color: ScreenColors.kWhiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(0, icon: Icons.home, label: 'Home'),

                _buildNavItem(1, icon: Icons.search, label: 'Search'),

                _buildNavItem(2, icon: Icons.list_alt_outlined, label: 'Appointment'),

                _buildNavItem(3, icon: Icons.person, label: 'Profile'),
              ],
            ),
          ),
        ),
    );
  }
  Widget _buildNavItem(int index, {required IconData icon, required String label}) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.onItemSelected(index),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 60,
            decoration: BoxDecoration(
              color: isSelected
                  ? ScreenColors.kIndigo.withAlpha(10)
                  : ScreenColors.kWhiteColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon,
                color: isSelected ? ScreenColors.kIndigo : ScreenColors.kGrey, size: 22),
          ),
          Text(
            label,
            style: TextStyle(color: isSelected ? ScreenColors.kIndigo : ScreenColors.kGrey,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : null),
          )
        ],
      ),
    );
  }
}