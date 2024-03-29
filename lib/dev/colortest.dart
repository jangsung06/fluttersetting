import 'package:flutter/material.dart';
import 'dart:async';

class SecondRoute extends StatefulWidget{

  final String name;
  const SecondRoute({required this.name});

  @override
  State<SecondRoute> createState()=> _SecondRouteState(name);
}

class _SecondRouteState extends State<SecondRoute> {
  final String name;

  int flag=0;
  List<Container> col=[];


  _SecondRouteState(this.name);
  @override
  void initState() {
    col.add(Container(
      color: Color(0xffFF0000),));
    col.add(Container(
      color: Color(0xff0000FF),));
    col.add(Container(
      color: Color(0xff00FF00),));
    col.add(Container(
      color: Color(0xff00FFFF),));
    col.add(Container(
      color: Color(0xffFF00FF),));
    col.add(Container(
      color: Color(0xffFFFFFF),));
    col.add(Container(
      color: Color(0xff000000),));
    col.add(Container(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 1.0),
          colors: const <Color>[
            Color(0xff000000),
            Color(0xffFFFFFF),
          ], // red to yellow
          tileMode: TileMode.repeated,
        ),
      ),
    ),);
    col.add(Container(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 1.0),
          colors: const <Color>[
            Color(0xffFFFFFF),
            Color(0xff000000),
          ], // red to yellow
          tileMode: TileMode.repeated,
        ),
      ),
    ),);
    col.add(Container(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1.0, 0.0),
          colors: const <Color>[
            Color(0xff000000),
            Color(0xffFFFFFF),
          ], // red to yellow
          tileMode: TileMode.repeated,
        ),
      ),
    ),);
    col.add(Container(
      decoration: const BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1.0, 0.0),
          colors: const <Color>[
            Color(0xffFFFFFF),
            Color(0xff000000),
          ], // red to yellow
          tileMode: TileMode.repeated,
        ),
      ),
    ),);



    super.initState();
    Timer(const Duration(seconds: 2), changeContainer);
  }

  void changeContainer()
  {
    if(mounted)
      {
        print("i am here $flag $this");
        flag++;
        flag=flag%col.length;
        //else if(flag==2) {flag=0;}

        setState(() {});
        Timer(const Duration(seconds: 2), changeContainer);
      }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:GestureDetector(
        onTap: (){ Navigator.pop(context);},
        child: SizedBox(
          child: Container(
            child: col[flag],
            //color: col[flag]


          ),
        ),
      ),

    );
  }
}
