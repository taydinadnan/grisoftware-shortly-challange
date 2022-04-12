import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../widgets/custom_painter.dart';
import '../widgets/info_text.dart';
import '../widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool visibilityTag = false;
  bool _validate = false;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  String shortUrl = "";
  String value = "";
  String buttonText = "Copy to Clipboard";
  bool isChanged = true;
  bool showCopyButton = false;
  TextEditingController urlcontroller = TextEditingController();

  getData() async {
    var url = 'https://api.shrtco.de/v2/shorten?url=${urlcontroller.text}';
    var response = await http.get(Uri.parse(url));
    var result = jsonDecode(response.body);
    if (result['ok']) {
      setState(() {
        shortUrl = result['result']['short_link'];
      });
    } else {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          logo(),
          showCopyButton == false ? _illustration() : _shortenedUrl(),
          showCopyButton
              ? SizedBox(height: MediaQuery.of(context).size.height * 0.32)
              : const SizedBox(height: 0),
          infoText(),
          _urlFieldWidget(),
        ],
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

  //bottom widgets that contains url text field, shorten button and bacground custom painter
  Widget _urlFieldWidget() {
    return Container(
      height: 200,
      color: Colors.purple,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            color: const Color.fromRGBO(59, 48, 84, 1),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.3),
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 40,
                child: TextField(
                  onChanged: (text) {
                    value = "URL : " + text;
                  },
                  controller: urlcontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _validate ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _validate ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 10,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: _validate
                        ? 'Please add a link here!'
                        : 'Shorten a link here ...',
                    hintStyle: TextStyle(
                      color: _validate ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    minimumSize: const Size(60, 40),
                  ),
                  child: const Text(
                    'SHORTEN IT!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    await getData();
                    setState(() {
                      urlcontroller.text.isEmpty
                          ? showCopyButton = false
                          : showCopyButton = true;
                      urlcontroller.text.isEmpty
                          ? _validate = true
                          : _validate = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildRow(String data, bool bool) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          data,
          style: const TextStyle(
            color: Colors.cyan,
            fontSize: 20,
          ),
        ),
        Builder(
          builder: (context) => ElevatedButton(
            child: Text(
              buttonText,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minimumSize: Size(50, 40),
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: shortUrl)).whenComplete(
                  () => Scaffold.of(context).showSnackBar(
                      const SnackBar(content: Text("Link is copied"))));
              setState(() {
                if (isChanged == true) {
                  buttonText = "Copied";
                }
              });
            },
          ),
        ),
      ],
    );
  }

  //shortened url widget
  Widget _shortenedUrl() {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              "Your URL Link:",
              style: TextStyle(
                color: Color.fromRGBO(59, 48, 84, 1),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            buildRow(
              shortUrl,
              false,
            ),
          ],
        ),
      ),
    );
  }
}
