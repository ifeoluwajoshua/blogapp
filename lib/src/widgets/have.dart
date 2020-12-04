
import 'package:blogapp/src/helpers/colors.dart';
import 'package:blogapp/src/helpers/fonts.dart';
import 'package:blogapp/src/helpers/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoYouHave extends StatelessWidget {
  const DoYouHave({
    Key key,
    @required this.style,this.press, this.ftext, this.stext
  }) : super(key: key);

  final TextStyle style;
   final Function press;
  final String ftext;
  final String stext;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: ftext,
        style: style.copyWith(
            fontSize: SizeConfig.textSize(
                context, 2.8),
            fontWeight: FontWeight.w500,
            fontFamily: afont),
        children: <TextSpan>[
          TextSpan(
            text: stext,
              recognizer: TapGestureRecognizer()
            ..onTap = press,
            style: style.copyWith(
                fontSize: SizeConfig.textSize(
                    context, 2.8),
                color: orange,
                fontWeight: FontWeight.w600,
                fontFamily: afont),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
