import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreen();
}

class _StatisticsScreen extends State<StatisticsScreen> {
  Widget _buildLandingPage() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Dashboard ", style: AppTextStyles.header1),
              Text(" home / dashboard", style: AppTextStyles.body),
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
                //STATISTICS
                Text("Statistics", style: AppTextStyles.AppTitle),
                Container(
                  width: screenWidth * 0.87,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5, left: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFFDF5F5), // background color
                    borderRadius: BorderRadius.circular(14), // corner radius
                    //border: Border.all(color: Colors.black, width: 2), // border
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Responses: "),
                      Text("Average Respone Score: "),
                      Text("Students: "),
                      Text("Employees"),
                    ],
                  ),
                ),
              ],
            ),
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
                //SURVEY STATUS
                Text("Survey Status", style: AppTextStyles.AppTitle),
                Container(
                  width: screenWidth * 0.87,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 5, left: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFFDF5F5), // background color
                    borderRadius: BorderRadius.circular(14), // corner radius
                    //border: Border.all(color: Colors.black, width: 2), // border
                  ),

                  child: Column(children: [Text("Training Needs Assessment")]),
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
      //appBar: AppBar(title: const Text("Statistics")),
      body: Center(child: _buildLandingPage()),
    );
  }
}
