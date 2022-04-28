import 'package:flutter/material.dart';
import 'package:news_app/home_screen/home.dart';
import '../constants/constant.dart';
import '../models/splash_model.dart';

class SplashContent extends StatefulWidget {
  
  const SplashContent({Key? key}) : super(key: key);

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  
  
  int currentIndex = 0;
  List<SplashModel> splashData = [
    SplashModel(
        "assets/images/splash1.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepared By Experts"),
    SplashModel(
        "assets/images/splash2.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    SplashModel(
        "assets/images/splash1.png",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];
  

  @override
  


  
  Widget build(BuildContext context) {
   
    return Stack(
      children: [
        PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: splashData.length,
            itemBuilder: (context, index) {
              return PageBuilderWidget(
                  title: splashData[index].titlestr,
                  description: splashData[index].description,
                  imgurl: splashData[index].imgStr);
            }),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.12,
          left: MediaQuery.of(context).size.width * 0.44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              splashData.length,
              (index) => buildDot(index: index),
            ),
          ),
        ),
        currentIndex < splashData.length - 1
            ? Positioned(
                bottom: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePageScreen()),
    ),
                      child: Text(
                        "SKIP",
                        style: TextStyle(fontSize: 18, color: primarygreen),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: lightgreenshede1,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "NEXT",
                        style: TextStyle(fontSize: 18, color: primarygreen),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: lightgreenshede1,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0))),
                      ),
                    )
                  ],
                ),
              )
            : Positioned(
                bottom: MediaQuery.of(context).size.height * 0.13,
                left: MediaQuery.of(context).size.width * 0.33,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18, color: primarygreen),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: lightgreenshede1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

// ignore: must_be_immutable
class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: primarygreen,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
