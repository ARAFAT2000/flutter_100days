import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchHomePage extends StatefulWidget {
  const SearchHomePage({super.key});

  @override
  State<SearchHomePage> createState() => _SearchHomePageState();
}

class _SearchHomePageState extends State<SearchHomePage> {



  List<String> data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  List<String> searchResults = [];
  void onQuearyChanged(String queary){
     setState(() {
       searchResults =data.where((item) => item.toLowerCase().contains(queary.toLowerCase())).toList();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search Systeam'),
      ),


      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20,top: 20,right: 20),
              child: TextFormField(
              onChanged: onQuearyChanged,
                decoration: InputDecoration(
                  labelText: 'Search here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
                itemBuilder:(context,index){
                  return ListTile(
                    title: Text(searchResults[index]),
                  trailing: Text('This is arafat '),
                  );
                })
          ),
        ],
      ),
    );
  }
}

