import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _logo(),
          _illustration(),
          _infoText(),
        ],
      ),
    );
  }

  // Logo Text
  Widget _logo() {
    return Center(
      child: SvgPicture.asset(
        'assets/logo.svg',
        fit: BoxFit.cover,
      ),
    );
  }

  //home screen illustration
  Widget _illustration() {
    return Center(
      child: SvgPicture.asset(
        'assets/illustration.svg',
        height: MediaQuery.of(context).size.height * 0.5,
      ),
    );
  }

  //information text
  Widget _infoText() {
    return Column(
      children: const [
        Center(
          child: Text(
            "Let's get started!",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(53, 50, 62, 10),
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: SizedBox(
            width: 200,
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Paste your first link into the field to shorten it",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromRGBO(76, 74, 85, 10),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
