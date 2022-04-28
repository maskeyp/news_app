import 'package:flutter/material.dart';


class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/frame2.png'),
        ),
      ),
    );
  }
}
