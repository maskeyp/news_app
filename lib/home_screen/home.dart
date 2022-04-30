import 'package:flutter/material.dart';
import 'package:news_app/services/remote_services.dart';

import '../models/news_model.dart';
import 'home_detail.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<NewsApiModel>? newsList;
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value.cast<NewsApiModel>();
          isLoaded = false;
        } else {
          // ignore: avoid_print
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        //backgroundColor: getColors[1],
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      // color: Colors.white,
                    ),
                    SizedBox(
                      width: size.width / 4,
                    ),
                    const Text(
                      "News App",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        //color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              isLoaded
                  ? SizedBox(
                      height: size.height / 20,
                      width: size.height / 20,
                      child: const CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return listItems(size, newsList![index]);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetail(
                      model: model,
                    )),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(5.0, 5.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const Text("Cant Load image"),
              ),
              Container(
                width: size.width / 1.1,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: size.width / 1.1,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.description,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
