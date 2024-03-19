import 'dart:convert';

import 'package:http/http.dart'as http;

import '../../Search_System/Api_search/Model/PostModel.dart';

class ReqresApi{

  void LogIn(String emai,password)async{

    try{
      final response= await http.post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': emai,
            'password':password
          }
      );
      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        print('Succesfully ');
      }else{
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }

  }
//post data
   Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return json.decode(response.body)['data'];
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }

//single user

  Future<List<dynamic>> signleuserData(String id) async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users${id}'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return json.decode(response.body)['data'];
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load data');
    }
  }


}