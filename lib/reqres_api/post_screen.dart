import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_100days/reqres_api/api_handle/reqres_api.dart';
import 'package:flutter_100days/reqres_api/single_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_100days/Search_System/Api_search/Model/PostModel.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

Future<List> reqresApi= ReqresApi().fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post Screen'),
      ),
      body:Center(
        child: FutureBuilder<List<dynamic>>(
          future:  reqresApi,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignlePage(
                            snapshot.data![index])),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index]['avatar']),
                    ),
                    title: Text(snapshot.data![index]['first_name'] + ' ' + snapshot.data![index]['last_name']),
                    subtitle: Text(snapshot.data![index]['email']),
                  );
                },
              );
            }
          },
        ),
      )
    );
  }
}
