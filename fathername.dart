import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profilepage/bloodgroup.dart';

class InsertFatherName extends StatefulWidget {
  const InsertFatherName({Key? key}) : super(key: key);

  @override
  State<InsertFatherName> createState() => _InsertFatherNameState();
}

class _InsertFatherNameState extends State<InsertFatherName> {
 
 adddata(value)async{
    await FirebaseFirestore.instance.collection("paitent").add({
      'Paitent Phone Number': value,
    });
 }
 String FatherName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                FatherName = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter Father name"  
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            adddata(FatherName);
          }, child: Text("Add Data")),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => InsertBlood(),
              ));
          }, child: Text("Move to next Page")),
        ],
      ),
    );
}
}