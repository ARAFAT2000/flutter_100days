import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_100days/reqres_api/api_handle/reqres_api.dart';
import 'package:http/http.dart'as http;

class RRLogIn extends StatefulWidget {
  const RRLogIn({super.key});

  @override
  State<RRLogIn> createState() => _RRLogInState();
}

class _RRLogInState extends State<RRLogIn> {
final emailController= TextEditingController();
final passwordController= TextEditingController();
  ReqresApi _reqresApi = ReqresApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Log In '),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30,right: 10,left: 10),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(onPressed: (){
              _reqresApi.LogIn(
                  emailController.text,
                  passwordController.text
              );
            },
                child: Text('Log In'))
          ],

        ),
      ),
    );
  }

  //LogIn(String email,password) this process measn ,,,,,log in button   a
  // emailController.text,
  // passeordController.text ai ta likhte hbe

  //LogIn() ai process means LogIn function a  kaj krte hbe


}
