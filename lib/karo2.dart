// import 'package:flutter/material.dart';
// import 'karo3.dart'; // Assuming this is another page for navigation
// import 'package:firebase_auth/firebase_auth.dart';
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// Future<void> verifyPhoneNumber(String phoneNumber) async {
//   await _auth.verifyPhoneNumber(
//     phoneNumber: phoneNumber,
//     verificationCompleted: (PhoneAuthCredential credential) async {
//       // Auto-retrieve verification code
//       await _auth.signInWithCredential(credential);
//     },
//     verificationFailed: (FirebaseAuthException e) {
//       // Verification failed
//     },
//     codeSent: (String verificationId, int? resendToken) async {
//       // Save the verification ID for future use
//       String smsCode = 'xxxxxx'; // Code input by the user
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: smsCode,
//       );
//       // Sign the user in with the credential
//       await _auth.signInWithCredential(credential);
//     },
//     codeAutoRetrievalTimeout: (String verificationId) {},
//     timeout: Duration(seconds: 60),
//   );
// }
//
// void main() {
//   runApp(Karo2());
// }
//
// class Karo2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Cab1(),
//       ),
//     );
//   }
// }
//
// class Cab1 extends StatefulWidget {
//   @override
//   State<Cab1> createState() => _Cab1State();
// }
//
// class _Cab1State extends State<Cab1> {
//   String? number; // Storing the phone number as a String
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
//             child: Text(
//               'Enter Phone number for verification',
//               style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
//             child: Text(
//               'The number will be used to send an SMS with a code for verification',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ),
//           TextField(
//             onChanged: (value) {
//               number = value; // Assigning the string value to `number`
//             },
//             keyboardType: TextInputType.phone, // Ensures numeric input
//             decoration: InputDecoration(
//               hintText: 'Enter your Number',
//               contentPadding:
//               EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.black,
//             margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 25.0),
//             child: TextButton(
//               onPressed: () {
//                 if (number != null && number!.length == 10) { // Simple validation
//                   verifyPhoneNumber(number as String).then((res) => {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Karo3()),
//                     )
//                   });
//
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Please enter a valid phone number')),
//                   );
//                 }
//               },
//               child: Center(
//                 child: Text(
//                   'Next',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:otpless_flutter/otpless_flutter.dart';

void main() {
  runApp(const Karo2());
}

class Karo2 extends StatefulWidget {

  const Karo2({Key? key}) : super(key: key);

  @override
  State<Karo2> createState() => _Karo2State();
}

class _Karo2State extends State<Karo2> {
  String _dataResponse = 'Unknown';
  final _otplessFlutterPlugin = Otpless();
  var loaderVisibility = true;
  final TextEditingController phoneOrEmailTextController = TextEditingController();
  String channel = "WHATSAPP";

  String phoneOrEmail = '';
  String otp = '';
  bool isInitIos = false;

  static const String appId = "QOMKCZU5CYDV86I95BMQ";

  @override
  void initState() {
    super.initState();
    _otplessFlutterPlugin.enableDebugLogging(true);
    if (Platform.isAndroid) {
      _otplessFlutterPlugin.initHeadless(appId);
      _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
      debugPrint("init headless sdk is called for android");
    }
    _otplessFlutterPlugin.setWebviewInspectable(true);
  }

  Future<void> openLoginPage() async {
    Map<String, dynamic> arg = {'appId': appId};
    _otplessFlutterPlugin.openLoginPage(onHeadlessResult, arg);
  }

  Future<void> startHeadlessWithChannel() async {
    if (Platform.isIOS && !isInitIos) {
      _otplessFlutterPlugin.initHeadless(appId);
      _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
      isInitIos = true;
      debugPrint("init headless sdk is called for ios");
      return;
    }
    Map<String, dynamic> arg = {'channelType': channel};
    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  Future<void> startHeadlessForPhoneAndEmail() async {
    if (Platform.isIOS && !isInitIos) {
      _otplessFlutterPlugin.initHeadless(appId);
      _otplessFlutterPlugin.setHeadlessCallback(onHeadlessResult);
      isInitIos = true;
      debugPrint("init headless sdk is called for ios");
      return;
    }
    Map<String, dynamic> arg = {};
    var x = double.tryParse(phoneOrEmail);
    if (x != null) {
      arg["phone"] = phoneOrEmail;
      arg["countryCode"] = "91";
    } else {
      arg["email"] = phoneOrEmail;
    }

    if (otp.isNotEmpty) {
      arg["otp"] = otp;
    }

    _otplessFlutterPlugin.startHeadless(onHeadlessResult, arg);
  }

  void onHeadlessResult(dynamic result) {
    setState(() {
      _dataResponse = jsonEncode(result);
    });
  }

  Future<void> changeLoaderVisibility() async {
    loaderVisibility = !loaderVisibility;
    _otplessFlutterPlugin.setLoaderVisibility(loaderVisibility);
  }

  @override
  void dispose() {
    phoneOrEmailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OTPless Flutter Plugin example app'),
        ),
        body: SafeArea(
            child:
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjusted margin
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // Makes the buttons fill the width
                    children: [
                      CupertinoButton.filled(
                        onPressed: openLoginPage,
                        child: const Text("Open Otpless Login Page"),
                      ),
                      // const SizedBox(height: 16), // Spacing between buttons
                      // CupertinoButton.filled(
                      //   onPressed: changeLoaderVisibility,
                      //   child: const Text("Toggle Loader Visibility"),
                      // ),
                      // const SizedBox(height: 16),
                      // CupertinoButton.filled(
                      //   onPressed: startHeadlessWithChannel,
                      //   child: const Text("Start Headless With Channel"),
                      // ),
                      // const SizedBox(height: 16),
                      // CupertinoButton.filled(
                      //     onPressed: handlePhoneHint,
                      //     child: const Text("Start phone hint")
                      // ),
                      // const SizedBox(height: 16),
                      // TextField(
                      //   controller: phoneOrEmailTextController,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       phoneOrEmail = value;
                      //     });
                      //   },
                      //   decoration: const InputDecoration(
                      //     hintText: 'Enter Phone or email here',
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // TextField(
                      //   onChanged: (value) {
                      //     setState(() {
                      //       otp = value;
                      //     });
                      //   },
                      //   decoration: const InputDecoration(
                      //     hintText: 'Enter your OTP here',
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // TextField(
                      //   onChanged: (value) {
                      //     setState(() {
                      //       channel = value;
                      //     });
                      //   },
                      //   decoration: const InputDecoration(
                      //     hintText: 'Enter channel',
                      //   ),
                      // ),
                      // const SizedBox(height: 16),
                      // CupertinoButton.filled(
                      //   onPressed: startHeadlessForPhoneAndEmail,
                      //   child: const Text("Start with Phone and Email"),
                      // ),
                      // const SizedBox(height: 16),
                      // Text(
                      //   _dataResponse,
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  ),
                ),
              ),
            )

        ),
      ),
    );
  }

  void handlePhoneHint() async {
    final result = await _otplessFlutterPlugin.showPhoneHint(true);
    setState(() {
      if (result["phoneNumber"] != null) {
        phoneOrEmail = result["phoneNumber"]!;
        phoneOrEmailTextController.text = phoneOrEmail;
      } else {
        _dataResponse = result["error"]!;
      }
    });
  }
}