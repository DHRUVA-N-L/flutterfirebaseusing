import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profilepage/bloodgroup.dart';

class InsertAlter extends StatefulWidget {
  const InsertAlter({Key? key}) : super(key: key);

  @override
  State<InsertAlter> createState() => _InsertAlterState();
}

class _InsertAlterState extends State<InsertAlter> {
  adddata(value)async{
    await FirebaseFirestore.instance.collection("paitent").add({
      'Altenative Contact Number': value,
    });
 }
 String alterna = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                alterna = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter Alternate Contact Number"  
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            adddata(alterna);
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