import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'email_signin_auth.dart';

class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
   FirebaseAuth _auth = FirebaseAuth.instance;


  TextEditingController emailController= TextEditingController();
  TextEditingController passWordController= TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('Email Authentication'),),

      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 25,right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
                 SizedBox(
           height: 15,
                 ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: passWordController,
                decoration: InputDecoration(
                    labelText: 'PassWord',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                child: ElevatedButton(onPressed: ()async{
                  if(_formKey.currentState!.validate() ){
                   _auth.createUserWithEmailAndPassword(
                       email: emailController.text.trim().toString(),
                       password: passWordController.text.trim().toString());
                   print('Sign Up Complease');
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>EmailSignIn()));
                  }
                },
                    child: Text('Sign Up')),
              )
            ],
          ),
        ),
      ),

    );
  }




  @override
  void dispose() {
    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
