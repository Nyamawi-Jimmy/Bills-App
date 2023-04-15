import 'package:elerarning/app_colors/colors.dart';
import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final String text;
  final Color? background;
  final Color? textColor;
  final Size? textSize;
  final Function()? onTap;
  final bool? isBoarder;

  Button({Key? key,
     this.background=AppColors.mainColor,
     this.textColor,
    required this.text,
     this.onTap,
    this.textSize,
    this.isBoarder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width-80,
        margin: EdgeInsets.only(left: 30,right: 30),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2,color: AppColors.mainColor,),
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: textColor
          ),),
        ),
      ),
    );
  }
}
