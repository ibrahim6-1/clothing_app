import 'package:clothing_app/app_styles.dart';
import 'package:clothing_app/product_detail.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomeScreen(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8) ,
          height: 64,
          child: CustomNavigationBar(
            isFloating: true,
            borderRadius: Radius.circular(40),
            selectedColor: sWhite,
            unSelectedColor: sGrey,
            backgroundColor: sBrown,
            strokeColor: Colors.transparent,
            scaleFactor: 0.1,
            iconSize: 40,
            items: [
              CustomNavigationBarItem(
                icon: _currentIndex == 0
                    ? SvgPicture.asset('assets/home_icon_selected.svg')
                    : SvgPicture.asset('assets/home_icon_unselected.svg'),
              ),
               CustomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SvgPicture.asset('assets/cart_icon_selected.svg')
                    : SvgPicture.asset('assets/cart_icon_unselected.svg'),
                    
              ),
               CustomNavigationBarItem(
                icon: _currentIndex == 2
                    ? SvgPicture.asset('assets/favorite_icon_selected.svg')
                    : SvgPicture.asset('assets/favorite_icon_unselected.svg'),
              ),
               CustomNavigationBarItem(
                icon: _currentIndex == 3
                    ? SvgPicture.asset('assets/account_icon_selected.svg')
                    : SvgPicture.asset('assets/account_icon_unselected.svg'),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index){
              setState(() {
                _currentIndex = index;
                
              });
            },
          ),
        ),
      ),
      // home: ProductDetail(),
    );
  }
}
