import 'package:flutter/material.dart';
import 'karo3.dart';
import 'karo2.dart';
void main() {
  runApp(const Karo1());
}
class Karo1 extends StatelessWidget {
  const Karo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.greenAccent[100],
        body: Cab(),
      ),);
  }
}
class Cab extends StatefulWidget {
  const Cab({super.key});

  @override
  State<Cab> createState() => _CabState();
}

class _CabState extends State<Cab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 120,width: 25.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child:Image.asset(
              'Images/karocab.jpg',
              fit: BoxFit.contain,
              height: 50,
            ),),
          SizedBox(width: 25.0,)
          ,Text('Karocab',style: TextStyle(fontSize: 40.0,color: Colors.black,fontWeight: FontWeight.bold),)],),
        Container(
          margin:EdgeInsets.symmetric(vertical: 5.0,horizontal: 25.0),
          child:Text('Explore your travel with best Services',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
        Card(
          color:Colors.black,
          margin:EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
          child: TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Karo2()));
          },
              child: Text('Continue With Phone Number',style: TextStyle(fontSize:19,fontWeight: FontWeight.bold,color: Colors.white ),)),
        ),
      ],
    ));
  }
}
