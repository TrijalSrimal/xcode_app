// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/constants.dart';

class userprolist extends StatefulWidget {
  const userprolist({Key? key}) : super(key: key);

  @override
  State<userprolist> createState() => _userprolistState();
}

class _userprolistState extends State<userprolist> {
    @override
  Widget build(BuildContext context){
    final user =  Provider.of<DocumentSnapshot?>(context);

    Map<String, dynamic> data = {};
    if(user!= null) {
      data = user.data() as Map<String, dynamic>;
    } else
      {
        return const CircularProgressIndicator();
      }

    mainCourse = data['Main Course'];
    return Flexible(
      flex:1,
      child: Column(children: [
        const SizedBox(height:10),
        Center(
          child: CircleAvatar(
            radius:50,
            child: ClipOval(
              child: Image.asset(
                'images/X_CODE.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height:6),
        Center(
            child: Text(data['Name'],style: const TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        ),
        const SizedBox(height:6),
        Text(data['Class'] + ", "  + data['Registration No.'],style: const TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        const SizedBox(height:6),
        Text(data['Email'],style: const TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 16)),
        const SizedBox(height:20),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              const SizedBox(height:20),
              Text("Achievements" ,style: TextStyle(color: Theme.of(context).colorScheme.primary, fontFamily: "Sarabun", fontSize: 30)),
              const SizedBox(height: 26),
              CircularPercentIndicator(
                radius: 110.0,
                lineWidth: 13.0,
                animation: true,
                percent: (data['Points']/data['ARRAY'].length),
                center: Text(
                  "Course Progress",
                  style:
                  TextStyle(fontFamily: "Sarabun", fontSize: 20.0 , color:Theme.of(context).colorScheme.primary,),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: HexColor("#E141B9"),
              ),
              ListTile(
            leading: Icon(Icons.ac_unit_sharp,color: Theme.of(context).colorScheme.primary,),
            title: Text("Points: ${data['Points']}",style: TextStyle(color:Theme.of(context).colorScheme.primary, fontFamily: "Sarabun", fontSize: 20)),
            onTap: (){}
              ),
              ListTile(
                leading: Icon(Icons.book,color: Theme.of(context).colorScheme.primary,),
                title: Text("Main Course: ${data['Main Course']}",style: TextStyle(color: Theme.of(context).colorScheme.primary, fontFamily: "Sarabun", fontSize: 20)),
                onTap: () {}
              ),
            ]
            ),
          ),
        )
      ]),
    );
  }
}
