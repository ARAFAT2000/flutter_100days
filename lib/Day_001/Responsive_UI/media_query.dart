

import 'package:flutter/material.dart';

///If the user has a preference set for different font sizes or wants to curtail animations.
///Using mediaQuery.of automatically causes the widgets to rebuild themselves according to the current device sizes and layout
///

import 'package:flutter/material.dart';

class RMediaQuery extends StatefulWidget {
  @override
  State<RMediaQuery> createState() => _RMediaQueryState();
}

class _RMediaQueryState extends State<RMediaQuery> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Media_query'),
      ),
       body: Column(
         children: [
           Container(
             height: screenheight/4,
             width: screenWidth/6,
             alignment: Alignment.center,
             color: Colors.yellow,
             margin: EdgeInsets.only(top: 25,left: 25),
             child: Text('MediaQuery 01'),
           ),

           Container(
             height: screenheight/13,
             //width: screenWidth/6,
             alignment: Alignment.center,
             color: Colors.yellow,
             margin: EdgeInsets.only(top: 25,left: 25),
             child: Text('MediaQuery 01'),
           ),


         ],
       ),
    );
  }
}

