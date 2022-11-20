import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

import '../constants/constants.dart';
import '../models/models.dart';
import 'detailPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //New

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Explore',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.w900,
                  fontSize: 44,
                  color: Color(0xFFFFFFFF),
                ),
                textAlign: TextAlign.left,
              ),
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: Text(
                      'Solar System',
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          color: Color(0x7cdbf1ff),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
                onChanged: (value) {},
                icon: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Image.asset('assets/drop_down_icon.png'),
                ),
                underline: const SizedBox(),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 10),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 40,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 18, space: 8),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: const TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 40,
                                          color: Color(0xFF47455F),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 23,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Know More',
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].positon,
                            child: Image.asset(planets[index].iconImage),
                          ),
                          Positioned(
                            right: 24,
                            bottom: 60,
                            child: Text(
                              planets[index].positon.toString(),
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w900,
                                fontSize: 200,
                                color: primaryTextColor.withOpacity(0.08),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 200),
        onTap: (index) {
          if (kDebugMode) {
            print(index);
          }
        },
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
/*          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_icon.png'),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/search_icon.png',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/profile_icon.png'),
          )*/
        ],
      ),
    );
  }
}
