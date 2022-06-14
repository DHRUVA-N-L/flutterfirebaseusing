import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profilepage/phone.dart';

class Insertname extends StatefulWidget {
  const Insertname({Key? key}) : super(key: key);

  @override
  State<Insertname> createState() => _InsertnameState();
}

class _InsertnameState extends State<Insertname> {
  
  adddata(value)async{
    await FirebaseFirestore.instance.collection("patient").add({
      'Patient name': value,
      
    });
  }
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              setState(() {
                name = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Enter name"  
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            adddata(name);
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
