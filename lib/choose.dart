import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Search(),
      ),
    ),
  );
}
class Search extends StatelessWidget {
  String? Where_from;
  String? Where_to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // 'Where From?' TextField
          TextField(
            onChanged: (value) {
              Where_from = value;
            },
            decoration: InputDecoration(
              hintText: 'Where From?',
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
      
          // 'Where to?' TextField
          TextField(
            onChanged: (value) {
              Where_to = value;
            },
            decoration: InputDecoration(
              hintText: 'Where To?',
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
      
          // Next Button
          Card(
            color: Colors.black,
            margin: EdgeInsets.symmetric(vertical: 115.0, horizontal: 25.0),
            child: TextButton(
              onPressed: () {
              },
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
