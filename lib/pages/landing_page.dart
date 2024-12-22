import 'package:english_ap/pages/home_page.dart';
import 'package:english_ap/values/app_assets.dart';
import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:flutter/material.dart';

//import 'package:english_ap/pages/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
              //color: Colors.red,
              alignment: Alignment.centerLeft,
              child: Text(
                'Wellcome to ',
                style: TextStyle(
                    fontFamily: FontFamily.sen,
                    fontSize: 41.82,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            )),
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          //alignment: Alignment.centerLeft,
                          'English',
                          style: AppStyles.h2.copyWith(
                              color: AppColors.blackGrey,
                              fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          //alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            'Quoute"',
                            textAlign: TextAlign.right,
                            style: AppStyles.h4.copyWith(
                                height: 0.1, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ))),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: RawMaterialButton(
                onPressed: () {
                  ////    chuyển hướng người dùng và  quay lại  đc
                  //Navigator.push(
                  //    context, MaterialPageRoute(builder: (context) => Home()));

                  // chuyển hướng người dùng và không quay lại
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
                },
                shape: CircleBorder(),
                fillColor: AppColors.lighBlue,
                child: Image.asset(AppAssets.rightArrow),

                //color: Colors.yellow,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
