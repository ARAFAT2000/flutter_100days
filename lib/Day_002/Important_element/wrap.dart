import 'package:flutter/material.dart';

class IEWrap extends StatefulWidget {
  const IEWrap({super.key});

  @override
  State<IEWrap> createState() => _IEWrapState();
}

class _IEWrapState extends State<IEWrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wrap and flow '),
      ),
      body: Wrap(
        spacing: 10,
        runSpacing: 10.6,
        runAlignment: WrapAlignment.spaceEvenly,
        verticalDirection: VerticalDirection.up,
        children:List.generate(
            10, (index) => Chip(
            label: Text('Game'),
              backgroundColor: Colors.yellow,
        ))
      ),
    );
  }
}
