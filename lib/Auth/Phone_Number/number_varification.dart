import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100days/Auth/Phone_Number/verify_code.dart';


class NumberVarification extends StatefulWidget {
  const NumberVarification({super.key});

  @override
  State<NumberVarification> createState() => _NumberVarificationState();
}

class _NumberVarificationState extends State<NumberVarification> {

  TextEditingController phoneNumberController =TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('Number Varification'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){

                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: phoneNumberController,
                decoration: InputDecoration(

                   hintText: '+44 7123 123 456',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                child: ElevatedButton(onPressed: ()async{

              if(_formKey.currentState!.validate()){

             ////Number varification Code

                _auth.verifyPhoneNumber(
                    timeout: const Duration(seconds: 60),
                    phoneNumber: phoneNumberController.text.toString(),
                    verificationCompleted: (PhoneAuthCredential credential)async{},
                    verificationFailed: (FirebaseAuthException e){},
                    codeSent: (String verificationId, int? resendToken){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyCode(
                          verificationId: verificationId)));
                    },
                    codeAutoRetrievalTimeout: (String verificationId){});



              }else{

              }
                  },
              child: Text('Varify Phone Number'),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
