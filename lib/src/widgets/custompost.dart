
import 'package:blogapp/src/helpers/colors.dart';
import 'package:blogapp/src/helpers/fonts.dart';
import 'package:blogapp/src/helpers/images.dart';
import 'package:blogapp/src/helpers/responsive.dart';
import 'package:flutter/material.dart';

class PostCategories extends StatelessWidget {
  const PostCategories({
    Key key,this.image, this.hcolor, this.tcolor, this.btext, this.htext, 
  }) : super(key: key);
  final String image;
  final Color hcolor;
  final Color tcolor;
   final String btext;
   final String htext;
   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: SizeConfig.xMargin(context, 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
           
            ),
             child: Image.asset(image, fit: BoxFit.cover,),
          ),
          SizedBox(width: SizeConfig.xMargin(context, 7)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: hcolor,
                ),
                child: Text(
                  btext,
                  style: TextStyle(
                      fontFamily: afont,
                      fontSize: SizeConfig.textSize(context, 4),
                      color: tcolor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: SizeConfig.yMargin(context, 1.5)),
              Container(
                width: SizeConfig.textSize(context, 52),
                child: Text(
                 htext,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: afont,
                      fontSize: SizeConfig.textSize(context, 4.5),
                      color: blueblack,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: SizeConfig.yMargin(context, 1)),
              Row(
                children: [
                  Icon(Icons.timer),
                  SizedBox(width: 5),
                  Text(
                    '30m ago',
                    style: TextStyle(
                      fontFamily: afont,
                      fontSize: SizeConfig.textSize(context, 3),
                      color: lblack,
                    ),
                  ),
                  SizedBox(width: 25),
                  Icon(Icons.comment_rounded),
                  SizedBox(width: 5),
                  Text(
                    '88 comments',
                    style: TextStyle(
                      fontFamily: afont,
                      fontSize: SizeConfig.textSize(context, 3),
                      color: lblack,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
