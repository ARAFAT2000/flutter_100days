import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'forgotten_password.dart';

class EmailSignIn extends StatefulWidget {
  const EmailSignIn({super.key});

  @override
  State<EmailSignIn> createState() => _EmailSignInState();
}

class _EmailSignInState extends State<EmailSignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;


  TextEditingController emailController= TextEditingController();
  TextEditingController passWordController= TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('Email Sign In Page'),),

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
                   _auth.signInWithEmailAndPassword(
                       email: emailController.text,
                       password:passWordController.text);
                   print('Sign In Complease');
                  }
                },
                    child: Text('Sign In')),
              ),
              SizedBox(
                child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPage()));
                },
                    child: Text('Forgott password')),
              ),
            ],
          ),
        ),
      ),

    );
  }
  void dispose() {

    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
