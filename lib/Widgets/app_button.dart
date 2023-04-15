import 'package:elerarning/app_colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData icon;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Function()? onTap;
  const AppButton({Key? key,
    this.text,
    required this.icon,
    this.fontSize,
    this.backgroundColor=Colors.white,
    this.iconColor=Colors.white,
    this.onTap,
    this.textColor=Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon,color: iconColor,size: 40,),
          ),
          text!=null?Text(text!,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: textColor
            ),):Container(),
        ],
      ),

    );
  }
}
