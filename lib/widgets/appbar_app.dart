import 'package:english_ap/values/app_assets.dart';
import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:flutter/material.dart';

class AppBart extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final VoidCallback onTap;

  const AppBart({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: AppBar(
        title: Text(
          title,
          style: AppStyles.h3.copyWith(
            color: AppColors.textColor,
            fontSize: 36,
          ),
        ),
        centerTitle: true,
        //elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: onTap,
          //onTap: () {
          //onTap(),
          //  //_scaffoldKey.currentState?.openDrawer();
          //  //Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          //  Navigator.pop(context);
          //},
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100); // Chiều cao AppBar
}
