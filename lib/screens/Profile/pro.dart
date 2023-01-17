import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/myButton.dart';
import 'package:untitled/screens/Profile/edit_profile.dart';

class userprolist extends StatefulWidget {
  const userprolist({Key? key}) : super(key: key);

  @override
  State<userprolist> createState() => _userprolistState();
}

class _userprolistState extends State<userprolist> {
  Future <void> navigateToEdit(context, int points, int streak) async {
    Navigator.push(
        context,
        PageTransition(
          child: EditWidget(points: points, streak: streak),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  @override
  Widget build(BuildContext context){
    final user =  Provider.of<DocumentSnapshot?>(context);

    Map<String, dynamic> data = new Map();
    if(user!= null)
      data = user?.data() as Map<String, dynamic>;
    return Flexible(
      flex:1,
      child: Column(children: [
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
        SizedBox(height:6),
        Center(
            child: Text(data['Name'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        ),
        SizedBox(height:6),
        Text(data['Class'] + ", "  + data['Registration No.'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        SizedBox(height:6),
        Text(data['Email'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 16)),
        SizedBox(height:20),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(height:20),
              Text("Achievements" ,style: TextStyle(color: HexColor("#4169E1"), fontFamily: "Sarabun", fontSize: 30)),
              SizedBox(height: 26),
              new CircularPercentIndicator(
                radius: 110.0,
                lineWidth: 13.0,
                animation: true,
                percent: data['Points']/110,
                center: new Text(
                  "Monthly Progress",
                  style:
                  new TextStyle(fontFamily: "Sarabun", fontSize: 20.0 , color:HexColor("#4169E1"),),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: HexColor("#E141B9"),
              ),
              ListTile(
            leading: Icon(Icons.ac_unit_sharp,color: HexColor("#4169E1"),),
            title: Text("Points: " + data['Points'].toString(),style: TextStyle(color:HexColor("#4169E1"), fontFamily: "Sarabun", fontSize: 20)),
            onTap: () => null,
              ),
              ListTile(
            leading: Icon(Icons.stream,color: HexColor("#4169E1"),),
            title: Text("Streaks: " + data['Coding Streak'].toString(),style: TextStyle(color: HexColor("#4169E1"), fontFamily: "Sarabun", fontSize: 20)),
            onTap: () => null,
              ),
            ]
            ),
          ),
        )
      ]),
    );
  }
}
