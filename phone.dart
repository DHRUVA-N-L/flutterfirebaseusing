import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profilepage/fathername.dart';
import 'package:profilepage/name.dart';

class Insertphone extends StatefulWidget {
  const Insertphone({Key? key}) : super(key: key);

  @override
  State<Insertphone> createState() => _InsertphoneState();
}

class _InsertphoneState extends State<Insertphone> {
  adddata(value)async{
    await FirebaseFirestore.instance.collection("paitent").add({
      'Paitent Phone Number': value,
    });
  }
  String Phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                Phone = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter Phone Number"  
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            adddata(Phone);
          }, child: Text("Add Data")),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => InsertFatherName(),
              ));
          }, child: Text("Move to next Page")),
        ],
      ),
    );
  }
}