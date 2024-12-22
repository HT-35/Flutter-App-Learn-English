import 'package:english_ap/values/app_assets.dart';
import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight((80)),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: AppBar(
                title: Text(
                  'English Today',
                  style: AppStyles.h3.copyWith(
                    color: AppColors.textColor,
                    fontSize: 36,
                  ),
                ),
                centerTitle: true,
                //elevation: 0,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print('hello');
                  },
                  child: Image.asset(AppAssets.menu),
                )),
          )),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              height: size.height * 1 / 10,
              child: Text(
                'It is amazing complete is the delusion that beauty is goodness.',
                style: AppStyles.h5.copyWith(color: AppColors.textColor),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: size.height * 2 / 3,
              child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //flex: 1,
                            //crossAxisAlignment: CrossAxisAlignment.end,

                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Image.asset(AppAssets.heart),
                                onPressed: () {},
                                alignment: Alignment.topRight,
                              )
                            ],
                          ),
                          Expanded(
                              flex: 2,
                              child: RichText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: 'B',
                                      style: AppStyles.h2.copyWith(
                                          fontSize: 80,
                                          fontWeight: FontWeight.w700,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(2, 1),
                                              blurRadius: 10,
                                            ),
                                          ],
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text: 'eautiful',
                                            style: AppStyles.h2.copyWith(
                                                fontSize: 60,
                                                shadows: [],
                                                color: Colors.white)),
                                      ]))),
                          Expanded(
                            flex: 4,
                            child: Text(
                                '"Think of all the beauty still left around you and be happy. "',
                                style: AppStyles.h4.copyWith(
                                    fontSize: 35,
                                    color: Colors.black,
                                    letterSpacing: 4)),
                          )
                        ],
                      ),
                    );
                  }),
            ),

            // indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: size.height * 1 / 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return buildIndicator(index == 0, size);
                      }),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 30),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            // ignore: avoid_print
            print('Vo Thanh Phuong');
          },
          backgroundColor: AppColors.primaryColor,
          child: Image.asset(AppAssets.exchange),
        ),
      ),
    );
  }
}

Widget buildIndicator(bool isActive, Size size) {
  return Container(
      height: 12,
      //alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lighBlue : AppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(2, 3), blurRadius: 3)
          ]));
}
