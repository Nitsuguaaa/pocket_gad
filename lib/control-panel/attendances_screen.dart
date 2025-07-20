import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class AttendancesScreen extends StatefulWidget {
  const AttendancesScreen({super.key});

  @override
  State<AttendancesScreen> createState() => _AttendancesScreen();
}

class _AttendancesScreen extends State<AttendancesScreen> {
  Widget _buildLandingPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Attendance ", style: AppTextStyles.header1),
              Text(" home / Attendance", style: AppTextStyles.body),
            ],
          ),
          Container(
            //STYLING
            width: screenWidth * 0.9,
            height: screenHeight * 0.3,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Color(0xFFDDCDD5), // background color
              borderRadius: BorderRadius.circular(16), // corner radius
              //border: Border.all(color: Colors.black, width: 2), // border
            ),

            //CONTENTS
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Attendance List", style: AppTextStyles.AppTitle),
                ElevatedButton(
                  onPressed: () {},

                  //STYLING
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(14)
                    )
                  ),

                  //CONTENTS
                  child: Row(children: [
                    Text("ARIBA! Kababaihan 2025",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',

                      ),
                    ),
                    SizedBox(width: 80,),
                    Container(
                      //STYLING
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)
                      ),


                      //CONTENTS
                      child: 
                      Text("Active",
                      style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                      )
                    ,)
                  ]),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: () {},

                  //STYLING
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(14)
                    )
                  ),

                  //CONTENTS
                  child: Row(children: [
                    Text("GAD Talk 2024",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',

                      ),
                    ),
                    SizedBox(width: 145,),
                    Container(
                      //STYLING
                      padding: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),


                      //CONTENTS
                      child: 
                      Text("Ended",
                      style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                      )
                    ,)
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Attendance")),
      body: Center(child: _buildLandingPage()),
    );
  }
}
