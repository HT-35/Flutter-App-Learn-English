import 'dart:math';
import 'package:english_ap/packages/quote/qoute_model.dart';
import 'package:english_ap/packages/quote/quote.dart';
import 'package:english_ap/pages/control_page.dart';
import 'package:english_ap/pages/favorites_page.dart';
import 'package:english_ap/values/share_keys.dart';
import 'package:english_ap/widgets/app_button.dart';
import 'package:english_words/english_words.dart';
import 'package:english_ap/models/englishToDay.dart';
import 'package:english_ap/values/app_assets.dart';
import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> word = [];

  List<String> word2 = [];
  String quouteRanDom = Quotes().getRandom().content!;
  List<int> fixedListRandom({
    int length = 1,
    int max = 120,
  }) {
    if (length > max) {
      return [];
    }

    List<int> newList = [];

    Random random = Random();

    int count = 1;

    while (count <= length) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  void getEnglish() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = prefs.getInt(ShareKeys.counter) ?? 5;
    List<String> newList = [];
    List<int> randomIndex =
        fixedListRandom(length: counter > 5 ? counter : 5, max: nouns.length);

    for (int index in randomIndex) {
      newList.add(nouns[index]);
    }

    word = newList.map((e) => getQuote(e)).toList();
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;

    quote = Quotes().getByWord(noun);

    return EnglishToday(
      id: quote?.id,
      noun: noun,
      quote: quote?.content,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    getEnglish();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
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
                    _scaffoldKey.currentState?.openDrawer();
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
              child: RichText(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: quouteRanDom,
                    style: AppStyles.h5.copyWith(color: AppColors.textColor)),
              ),
            ),

            SizedBox(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: word.isNotEmpty ? word.length : 0,
                  itemBuilder: (context, index) {
                    String fristVocabulary = word[index].noun != ''
                        ? word[index].noun!.substring(0, 1).toUpperCase()
                        : '';

                    String vocabulary = word[index].noun != ''
                        ? word[index]
                            .noun!
                            .substring(1, word[index].noun!.length)
                        : '';

                    String qouteString = word[index].quote ?? '';
                    return Container(
                      padding: const EdgeInsets.all(11),
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(3, 5),
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //flex: 1,
                            //crossAxisAlignment: CrossAxisAlignment.end,

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$index',
                                style: AppStyles.h3,
                              ),
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                      text: fristVocabulary,
                                      style: AppStyles.h2.copyWith(
                                          fontSize: 80,
                                          fontWeight: FontWeight.w700,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  // ignore: deprecated_member_use
                                                  Colors.black.withOpacity(0.5),
                                              offset: Offset(2, 1),
                                              blurRadius: 10,
                                            ),
                                          ],
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text: vocabulary,
                                            style: AppStyles.h2.copyWith(
                                                fontSize: 60,
                                                shadows: [],
                                                color: Colors.white)),
                                      ]))),
                          Expanded(
                            flex: 4,
                            child: RichText(
                                maxLines: 8,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    //text: '"Think of all the beauty still left around you and be happy. "',
                                    text: qouteString != '' ? qouteString : '',
                                    style: AppStyles.h4.copyWith(
                                        fontSize: 28,
                                        color: Colors.black,
                                        letterSpacing: 4))),
                          )
                        ],
                      ),
                    );
                  }),
            ),

            // indicator
            //Padding(
            //  padding: const EdgeInsets.symmetric(horizontal: 40),
            //  //widthFactor: 400,
            //  child: SizedBox(
            //    height: size.height * 1 / 15,
            //    child: Container(
            //      padding: const EdgeInsets.symmetric(vertical: 24),
            //      alignment: Alignment.center,
            //      child: ListView.builder(
            //          //physics:
            //          //    NeverScrollableScrollPhysics(), // không cho scroll indicator
            //          scrollDirection: Axis.horizontal,
            //          //itemCount: 5,
            //          itemCount: word.isNotEmpty ? word.length : 0,
            //          itemBuilder: (context, index) {
            //            return buildIndicator(index == _currentIndex, size);
            //          }),
            //    ),
            //  ),
            //)
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
            setState(() {
              getEnglish();
              //_currentIndex = 0;
            });
          },
          backgroundColor: AppColors.primaryColor,
          child: Image.asset(AppAssets.exchange),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lighBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.s,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Your Mind',
                    style: AppStyles.h3.copyWith(color: Colors.black)),
                AppButton(
                    label: 'Favorites',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FavoritesPage()));
                    }),
                AppButton(
                    label: 'Your Control',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ControlPage()));
                    }),
              ],
            ),
          ),
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
