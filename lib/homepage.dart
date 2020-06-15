import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handleError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleWallet);
  }

  @override
  void openCheckOut() {
    String api;
    var options = {
      "key": "$api",
      "amount": textEditingController.text,
      "name": "Sample App",
      "description": "Payment for some random product",
      "prefill": {
        "contact": "8459701511",
        "email": "1rahulchandra1@gmail.com",
      },
      "external": {
        "wallets": ["paytm"],
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlePaymentSuccess() {
    print("Payment Success");
    Toast.show("Payment Successful", context);
  }

  void handleError() {
    Toast.show("Error In Payment", context);
  }

  void handleWallet() {
    Toast.show("Wallet Handling in Progress", context);
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
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: "Amount to Pay"),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            color: Colors.purple,
            child: Text(
              "Donate Now Button",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            onPressed: () {
              openCheckOut();
            },
          )
        ],
      ),
    );
  }
}
