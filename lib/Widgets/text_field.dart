import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSize extends StatelessWidget {
  String text;
  final Color color;

  TextSize({Key? key,
  required this.text,
    required this.color,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize=_textSize(text);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text!,style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w700,
          ),
            overflow: TextOverflow.clip,
            maxLines: 1,
            softWrap: false,
          ),
          SizedBox(height: 2,),
          Row(
            children: [
              for(int i=0;i<textSize.width/4.5;i++)
                i.isEven?Container(
                  width: 5,
                  height: 2,
                  color: color,
                ):Container(
                  width: 5,
                  height: 2,
                  color: Colors.white,
                )
            ],
          )
        ],
      ),
    );
  }
  _textSize(String text){
    final TextPainter textPainter =
TextPainter(
  text: TextSpan(text: text, style: TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: color,
  )),
      maxLines: 1,
  textDirection: TextDirection.ltr,

)..layout(minWidth: 0,maxWidth: double.maxFinite);

return textPainter.size;
  }
}
