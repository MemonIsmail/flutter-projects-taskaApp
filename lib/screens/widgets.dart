import 'package:flutter/material.dart';
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
    this.textEditingController,
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
    return TextField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: kGreyColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          suffixIcon: IconButton(
              icon: Icon(suffIcon),
              onPressed:onPressed
          ),
          suffixIconColor: kGreyColor,
          prefixIcon: prefIcon != null ? Icon(prefIcon) : null,
          prefixIconConstraints: prefIcon == null
              ? const BoxConstraints()
              : null,
          prefixIconColor: kGreyColor,
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
      onTap: onTap,
    );
  }
}
