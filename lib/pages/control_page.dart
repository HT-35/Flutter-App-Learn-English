import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:english_ap/values/share_keys.dart';

import 'package:english_ap/widgets/appbar_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});
  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;
  String numberCount = '5';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBart(
          title: 'Control',
          onTap: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setInt(ShareKeys.counter, int.parse(numberCount));
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }),
      body: SizedBox(
        //padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'How much a number word at once ?',
                style: AppStyles.h5.copyWith(color: Colors.black, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                numberCount,
                style: AppStyles.h1.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 180),
              ),
            ),
            Slider(
                value: sliderValue,
                min: 5,
                max: 20,
                divisions: 15,
                inactiveColor: AppColors.primaryColor,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  if (value > 5) {
                    setState(() {
                      sliderValue = value;
                      numberCount = value.toString().split('.')[0];
                    });
                  } else {
                    setState(() {
                      sliderValue = 5;
                      numberCount = '5';
                    });
                  }
                }),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Slide to set',
                style: AppStyles.h5.copyWith(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
