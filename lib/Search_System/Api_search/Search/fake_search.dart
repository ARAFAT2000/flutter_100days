import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_100days/Search_System/Api_search/Model/FakeModel.dart';
import 'package:http/http.dart'as http;
/// it is not correct way to search
/// it is just display the data systeam
class FakeApiSearch extends StatefulWidget {
  const FakeApiSearch({super.key});

  @override
  State<FakeApiSearch> createState() => _FakeApiSearchState();
}

class _FakeApiSearchState extends State<FakeApiSearch> {
List<FakeModel> fakemodel=[];
List<FakeModel> searchmodel=[];

void UpdateModel(String val){
  setState(() {
    if(val.isEmpty){
      searchmodel=fakemodel;
    }else{
      searchmodel =fakemodel.where((element) => element.title!.toLowerCase().contains(val.toLowerCase())).toList();
    }
  });
}

Future<List<FakeModel>> getfakedata()async{

  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

  var data = jsonDecode(response.body.toString());
  if(response.statusCode==200){

    for(Map i in data){
      fakemodel.add(FakeModel.fromJson(i));
    }
    return fakemodel;
  }else{
    return fakemodel;
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Fake Api'),
      ),

     body: Padding(
       padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
       child: Column(
         children: [
           Expanded(
             flex: 1,
               child: TextFormField(
                 onChanged: (value){
                 UpdateModel(value);
                 },
                 decoration: InputDecoration(
                   labelText: 'Search here',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(15)
                   )
                 ),
               )),
           Expanded(
               flex: 4,
               child: FutureBuilder(
                   future: getfakedata(),
                   builder: (context,snapshot){
                     return ListView.builder(
                       itemCount: searchmodel.length,
                         itemBuilder: (context,index){
                           return Card(
                             child: Container(
                               margin: EdgeInsets.only(top: 10,left: 20),
                               height: 50,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(searchmodel[index].title.toString())
                                 ],
                               ),
                             ),
                           );
                         });
                   })),
         ],
       ),
     ),

    );
  }
}
