import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // bgColor static
  static const Color bgColor = Color.fromRGBO(250, 214, 233, 0.6);

  Widget _buildLandingPage() {
  return Container(
    margin: const EdgeInsets.all(10.0),
    height: 300.0,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        "     Gender and Development or GAD primarily promotes women’s empowerment and ensure that their full participation becomes essential for society. It has been formed by the government to respond to the gender imbalances and inequalities existing in the country. GAD works to eradicate gender biases to fully release the potential of women so they can perform active roles in the development process. Overall, GAD is not only about women and their rights but also about men and women in sharing benefits and responsibilities.",
        style: TextStyle(
          fontFamily: 'FlexSlider',
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        softWrap: true,
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Landing Page"),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Gender and Development - Batangas State University",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(221, 255, 0, 225),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "What is GAD?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text container (left)
                Flexible(
                  flex: 2,
                  child: _buildLandingPage(),
                ),

                const SizedBox(width: 16),

                // Image (right)
                Flexible(
                  flex: 1,
                  child: Image.asset(
                    'assets/photos/slider-dec.png',
                    width: 400,
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
  }
}