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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Statistics", style: AppTextStyles.header1),
              Text(" home / Statistics", style: AppTextStyles.body),
            ],
          ),
          Container(
            //STYLING
            width: screenWidth * 0.9,
            height: screenHeight * 0.53,
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
                  //height: screenHeight * 0.5,
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
                      Container(
                        //STYLING
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.1,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF10A3B6), // background color
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // corner radius
                          //border: Border.all(color: Colors.black, width: 2), // border
                        ),

                        //CONTENTS
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Responses",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 150),
                            //Text("More Info"),
                          ],
                        ),
                      ),
                      Container(
                        //STYLING
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.1,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF05A94F), // background color
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // corner radius
                          //border: Border.all(color: Colors.black, width: 2), // border
                        ),

                        //CONTENTS
                        child: Row(
                          children: [
                            SizedBox(width: 27,),
                            Column(
                              children: [
                                Text(
                                  "00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "ARS",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 160),
                            //Text("More Info"),
                          ],
                        ),
                      ),
                      Container(
                        //STYLING
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.1,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFE6A30E), // background color
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // corner radius
                          //border: Border.all(color: Colors.black, width: 2), // border
                        ),

                        //CONTENTS
                        child: Row(
                          children: [
                            SizedBox(width: 7,),
                            Column(
                              children: [
                                Text(
                                  "00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Students",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 150),
                            //Text("More Info"),
                          ],
                        ),
                      ),
                      Container(
                        //STYLING
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.1,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFDE2948), // background color
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // corner radius
                          //border: Border.all(color: Colors.black, width: 2), // border
                        ),

                        //CONTENTS
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Employees",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 160),
                            //Text("More Info"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            //STYLING
            width: screenWidth * 0.9,
            height: screenHeight * 0.7,
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

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Training Needs Assessment", style: TextStyle(fontFamily: 'Roboto'),)]),
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
