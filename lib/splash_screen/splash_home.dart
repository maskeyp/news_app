import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/constants/constant.dart';
import 'package:news_app/home_screen/home.dart';
import 'package:news_app/splash_screen/splash_content.dart';
import 'package:news_app/splash_screen/splash_frame.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void completed() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const HomePageScreen()),
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 5), completed);
  // }

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        const FramePage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 150,
                    //color: Colors.white,
                    child: Center(
                      child: Text(
                        'We show news for you',
                        style: kHeading,
                      ),
                    ),
                  ),
                  Container(
                    height: 525,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    // color: Colors.white,
                    child: const SplashContent(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
