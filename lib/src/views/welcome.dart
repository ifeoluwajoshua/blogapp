import 'package:blogapp/src/helpers/colors.dart';
import 'package:blogapp/src/helpers/fonts.dart';
import 'package:blogapp/src/helpers/images.dart';
import 'package:blogapp/src/helpers/responsive.dart';
import 'package:blogapp/src/views/postpage.dart';
import 'package:blogapp/src/widgets/custompost.dart';
import 'package:flutter/material.dart';

class BlogHome extends StatefulWidget {
  @override
  _BlogHomeState createState() => _BlogHomeState();
}

class _BlogHomeState extends State<BlogHome> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(profile),
                      ),
                      Spacer(),
                      Icon(Icons.dehaze)
                    ],
                  ),
                  SizedBox(height: SizeConfig.yMargin(context, 2)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black54)),
                    child: Image.asset(homeheader),
                  ),
                  SizedBox(height: SizeConfig.yMargin(context, 2)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => PostPage()));
                    },
                    child: Text(
                      'How to run a More Effective\nMeeting',
                      style: TextStyle(
                          fontFamily: afont,
                          fontSize: SizeConfig.textSize(context, 5.5),
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
                          fontSize: SizeConfig.textSize(context, 3.5),
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
                          fontSize: SizeConfig.textSize(context, 3.5),
                          color: lblack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.yMargin(context, 4)),
                  Row(
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontFamily: afont,
                            fontSize: SizeConfig.textSize(context, 5.5),
                            color: blueblack,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        'Seel all',
                        style: TextStyle(
                            fontFamily: afont,
                            fontSize: SizeConfig.textSize(context, 4),
                            color: orange,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.yMargin(context, 3.5)),
                  PostCategories(
                    image: aimage,
                    hcolor: Colors.yellow[800],
                    tcolor: Colors.white,
                    btext: 'Design',
                    htext:
                        'Top ten Technology to get rid of clutters in design system',
                  ),
                  PostCategories(
                    image: bimage,
                    hcolor: Colors.blue[800],
                    tcolor: Colors.white,
                    btext: 'Design',
                    htext: 'How to Send email in background - Flutter',
                  ),
                     PostCategories(
                    image: aimage,
                    hcolor: Colors.yellow[800],
                    tcolor: Colors.white,
                    btext: 'Design',
                    htext:
                        'Top ten Technology to get rid of clutters in design system',
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
