import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Search_System/Api_search/Search/search_home_page.dart';


class VerifyCode extends StatefulWidget {
 final String verificationId;
const VerifyCode({required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController verifyController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Verify Screen'),
      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 25),
        child: Column(
          children: [

             TextFormField(
               controller: verifyController,
               decoration: InputDecoration(
                 hintText: '6 digit Code '
               ),
             ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: ()async{
                print(widget.verificationId);
                print(verifyController.text.toString());
              PhoneAuthCredential credential= PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verifyController.text.toString());
               try{
                await _auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SHomePage()));

               }catch(e){
                 print(e.toString());
               }
              },
                child: Text('Varify Phone Number'),),
            )

          ],
        ),
      ),
    );
  }
}
