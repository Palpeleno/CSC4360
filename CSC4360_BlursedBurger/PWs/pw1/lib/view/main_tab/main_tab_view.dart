// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pw1/view/home/newpage_view.dart';
import 'package:pw1/view/home/jounral_entries.dart';
import 'package:pw1/view/home/profile_view.dart';
import 'package:pw1/view/home/settings_view.dart';
import '../../common/color_extension.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = JounralView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.base,
      body: Stack(
        children: [
          // TODO there might be issue with making subsequent pages so come back here for that
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/img/backgroundUtilNavigationbar.png"),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              onPressed: () {
                                setState(() {
                                  selectTab = 1;
                                  currentTabView = SettingsView();
                                });
                              },
                              tooltip: 'settings',
                              icon: Icon(
                                Icons.settings,
                                size: 40.0,
                                color: TColor.white,
                              ),
                            ),
                            // SizedBox(width: 40.0),
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              onPressed: () {
                                setState(() {
                                  selectTab = 2;
                                  currentTabView = UserProfileView();
                                });
                              },
                              tooltip: 'profile',
                              icon: Icon(
                                Icons.person_4_outlined,
                                size: 40.0,
                                color: TColor.white,
                              ),
                            ),
                            // SizedBox(width: 40.0),
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              onPressed: () {
                                setState(() {
                                  selectTab = 3;
                                  currentTabView = JounralView();
                                });
                              },
                              tooltip: 'Journals',
                              icon: Icon(
                                Icons.book_outlined,
                                size: 40.0,
                                color: TColor.white,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = NewJournalPageView();
                                });
                              },
                              tooltip: 'new page',
                              icon: Icon(
                                Icons.add_comment_outlined,
                                size: 40.0,
                                color: TColor.white,
                              ),
                            ),
                            // temp button funtion
                            // IconButton(
                            //   padding: EdgeInsets.symmetric(horizontal: 40),
                            //   onPressed: () {
                            //     setState(() {
                            //       selectTab = 3;
                            //       currentTabView = Container();
                            //     });
                            //   },
                            //   tooltip: 'dark mode/light mode',
                            //   icon: Icon(
                            //     Icons.dark_mode_outlined,
                            //     size: 40.0,
                            //     color: TColor.white,
                            //   ),
                            // ),
                            // instead of a new page make a banner pop up reguardless,
                            // of page to prompt a logout opportunity
                            IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              onPressed: () {
                                setState(() {
                                  selectTab = 4;
                                  currentTabView = Container();
                                });
                              },
                              tooltip: 'logout',
                              icon: Icon(
                                Icons.logout_rounded,
                                size: 40.0,
                                color: TColor.white,
                              ),
                            ),
                          ], // icon button children
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
