import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taska_app/controllers/text_field_controller.dart';
import 'package:taska_app/screens/screens_colors.dart';

class CustomHeadingText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  const CustomHeadingText({super.key, required this.text,required this.textColor, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final RxBool isFocused;
  final FocusNode focusNode;
  final bool obscureText;
  final IconData? suffIcon;
  final IconData? prefIcon;
  final Function()? onPressed;
  final Function()? onTap;
  final String hintText;
  final double borderRadius;
  final ValueChanged<String>? onChanged;
  final bool fill;
  final Color filColor;
  final Color borderColor;
  final double borderWidth;
  const CustomTextField({
    super.key,
    required this.isFocused,
    required this.textEditingController,
    required this.focusNode,
    this.onChanged,
    required this.hintText,
    this.obscureText=false,
    this.suffIcon,
    this.onPressed,
    this.onTap,
    this.prefIcon,
    this.borderRadius = 10,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.fill = false,
    this.filColor = kWhiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool focused = isFocused.value;
      return TextField(
        controller: textEditingController,
        focusNode: focusNode,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: kGreyColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.transparent,
                )
            ),
            suffixIcon: IconButton(
                icon: Icon(suffIcon),
                onPressed:onPressed
            ),
            suffixIconColor: kGreyColor,
            prefixIcon: Icon(
                prefIcon,
                color: focused
                  ? Colors.black
                  : kGreyColor,
            ),
            filled: true,
            fillColor: focused
              ? kWhiteColor
              : kLightGreyColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: kIndigoAccent,
                  width: 1.5,
                )
            )
        ),
        onChanged: onChanged,
        onTap: onTap,
      );
    }
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  const CustomElevatedButton({super.key, required this.text, required this.buttonColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: textColor,
        // elevation: 0.0
      ),
      child: Text(text),
    );
  }
}

