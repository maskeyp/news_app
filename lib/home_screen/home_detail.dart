import 'package:flutter/material.dart';

import '../models/news_model.dart';

class NewsDetail extends StatelessWidget {
  final NewsApiModel model;

  const NewsDetail({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(141, 24, 15, 15),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: size.width / 1.05,
                  child: Text(
                    model.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: size.height / 3,
                  width: size.width / 1.05,
                  alignment: Alignment.center,
                  child: model.imageUrl != ""
                      ? Image.network(
                          model.imageUrl,
                          fit: BoxFit.cover,
                        )
                      : const Text(
                          "Unable to load image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                SizedBox(
                  width: size.width / 1.05,
                  child: Text(
                    model.content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
