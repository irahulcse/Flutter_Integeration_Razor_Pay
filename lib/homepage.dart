import 'dart:html';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Razorpay razorpay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(event, handler)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Razor Payment Integeration",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 50,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            child: Text("Donate Now Button"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
