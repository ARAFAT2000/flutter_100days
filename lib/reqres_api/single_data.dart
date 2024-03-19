import 'package:flutter/material.dart';
import 'package:flutter_100days/reqres_api/api_handle/reqres_api.dart';


import 'package:flutter/material.dart';

class SignlePage extends StatelessWidget {
  final Map<String, dynamic> user;

  SignlePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              '${user['first_name']} ${user['last_name']}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              user['email'],
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

