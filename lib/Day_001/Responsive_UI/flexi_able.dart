import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RFlexiable extends StatefulWidget {
  const RFlexiable({super.key});

  @override
  State<RFlexiable> createState() => _RFlexiableState();
}

class _RFlexiableState extends State<RFlexiable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flexiable'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellow,
                  child: Text('Flexiable'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20,top: 20),
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.red,
                  child: Text('Flexiable'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
