import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
class FakeApiNotModel extends StatefulWidget {
  const FakeApiNotModel({super.key});

  @override
  State<FakeApiNotModel> createState() => _FakeApiNotModelState();
}

class _FakeApiNotModelState extends State<FakeApiNotModel> {

  /// it is correct way from the search systeam
  ///
  List<Map<String ,dynamic>>allProduct=[];
  List<Map<String ,dynamic>> searchproduct=[];
  var data;
  getProducts()async{
    var response= await http.get(Uri.parse('https://fakestoreapi.com/products'));

   if(response.statusCode==200){
    data = jsonDecode(response.body);
   }else{
     print('error');
   }
   for(var i=0; i<data.length;i++){
     allProduct.add({
       'id':data[i]['id'],
       'title':data[i]['title'],
       'price':data[i]['price'],
     });
     setState(() {
       allProduct;
     });
   }
  }
  UpdateSearch(String val){
    setState(() {
      if(val.isEmpty){
        searchproduct=allProduct;
      }else {
        searchproduct =allProduct.where((element) => element['title'].toString().toLowerCase().contains(val.toLowerCase())).toList();
      }
    });
 }
@override
  void initState() {
    // TODO: implement initState
  getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search System'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: Column(
          children: [
            Expanded(
                child: TextFormField(
                  onChanged: (value){
                    UpdateSearch(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                )),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount:searchproduct.length,
                  itemBuilder: (context,index){

                    return Card(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 5,left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(searchproduct[index]['title']),
                            Text(searchproduct[index]['price'].toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
