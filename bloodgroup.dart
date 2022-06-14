import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profilepage/phone.dart';

class InsertBlood extends StatefulWidget {
  const InsertBlood({Key? key}) : super(key: key);

  @override
  State<InsertBlood> createState() => _InsertBloodState();
}

class _InsertBloodState extends State<InsertBlood> {
   adddata(value)async{
    await FirebaseFirestore.instance.collection("paitent").add({
      'Paitent Blood Group': value,      
    });
  }
  String grp = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                grp = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter Paitent Blood Group"  
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            adddata(grp);
          }, child: Text("Add Data")),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Insertphone(),
              ));
          }, child: Text("Move to next Page")),
        ],
      ),
    );
  }
}