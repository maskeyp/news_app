import 'package:flutter/material.dart';

class SplashHeader extends StatelessWidget {
  const SplashHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'We Show News For You',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
