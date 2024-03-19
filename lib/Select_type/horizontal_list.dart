import 'package:flutter/material.dart';

import '../Search_System/search_home_page.dart';




class HorizontalList extends StatefulWidget {

  HorizontalList({super.key});

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  List<String> monthlist = ['January', 'February', 'March', 'April', 'May', 'June','July', 'August', 'September', 'October', 'November', 'December',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Horizontal List Selects'),
      ),
      body: Container(
        height: 50.0, // Adjust the height according to your needs
        child: ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount: monthlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: InkWell(

                  onTap: (){
              
                  },
                  child: Container(
                    color: Colors.lightGreen, // Change the color as needed
                    width: 100.0, // Adjust the width according to your needs
                    height: 60.0, // Adjust the height according to your needs
                    child: Center(
                      child: Text(
                      monthlist[index].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
