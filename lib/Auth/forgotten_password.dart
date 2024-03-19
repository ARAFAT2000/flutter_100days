import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('Email Sign In Page'),),

      body: Column(
        children: [
          TextFormField(
            controller: emailController,
          ),
          SizedBox(
            height: 15,
          ),

          ElevatedButton(
              onPressed: (){
                _auth.sendPasswordResetEmail(
                    email: emailController.text.toString());
              },
              child:Text('Forgote'))
        ],
      ),
    );

  }
}
