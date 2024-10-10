import 'package:flutter/material.dart';
import 'choose.dart';

void main() {
  runApp(const Karo3());
}

class Karo3 extends StatelessWidget {
  const Karo3({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: cab2(),
      ),
    );
  }
}

class cab2 extends StatefulWidget {
  const cab2({super.key});

  @override
  State<cab2> createState() => _cab2State();
}

class _cab2State extends State<cab2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 45.0, horizontal: 25.0),
            child: Text(
              'Please wait.'
                  'We will verify the OTP sent to +918530046094',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            onChanged: (value) {// Assigning the string value to `number`
            },
            keyboardType: TextInputType.phone, // Ensures numeric input
            decoration: InputDecoration(
              hintText: 'Enter your OTP',
              contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
          Container(
            child: Text(
              '(mm:ss)',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            color: Colors.black,
            margin: EdgeInsets.symmetric(vertical: 180.0, horizontal: 25.0),
            child:TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));},
              child: Center(
                child: Text('Verify',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
