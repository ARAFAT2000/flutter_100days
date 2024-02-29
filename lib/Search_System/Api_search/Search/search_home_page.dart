import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/PostModel.dart';

class SHomePage extends StatefulWidget {
  const SHomePage({super.key});

  @override
  State<SHomePage> createState() => _SHomePageState();
}

class _SHomePageState extends State<SHomePage> {
  List<Map<String ,dynamic>> postmodel = [];
  List<Map<String ,dynamic>> searchmodel = [];


  TextEditingController searchController = TextEditingController();

  void updateList(String val) {
    setState(() {

      if (val.isEmpty) {
        searchmodel= postmodel;
      } else {
        searchmodel = postmodel.where((element) =>
            element['title'].toString().toLowerCase().contains(val.toLowerCase())).toList();
      }
      setState(() {
        postmodel;
      });
    });
  }

  var data;
  Future<List<Map<String, dynamic>>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
       data = jsonDecode(response.body.toString());
    } else {
      return postmodel;
    }
    for(var i=0; i<data.length; i++ ){
      postmodel.add({
        'userId': data[i]['userId'],
        'title': data[i]['title']
      });
    }
    return postmodel;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Arafat'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 25),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    updateList(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Search here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          itemCount: searchmodel.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                              
                                  Text(searchmodel[index]['title'].toString()),
                                  Text(searchmodel[index]['id'].toString()),
                              
                                ],
                              ),
                            );
                          });
                    }))
          ],
        ),
      ),
    );
  }
}
