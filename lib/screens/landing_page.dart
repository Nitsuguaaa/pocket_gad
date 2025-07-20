import 'package:flutter/material.dart';
import 'package:pocket_gad/utils/app_text_style.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static const Color bgColor = Color(0xFFFAD6E9);

  Widget _buildLandingPage() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gender and Development or GAD primarily promotes women’s empowerment and ensure that their full participation becomes essential for society. It has been formed by the government to respond to the gender imbalances and inequalities existing in the country. GAD works to eradicate gender biases to fully release the potential of women so they can perform active roles in the development process. Overall, GAD is not only about women and their rights but also about men and women in sharing benefits and responsibilities.",
            style: AppTextStyles.body4,
            textAlign: TextAlign.justify,
            softWrap: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _buildContactDialog(context),
              );
            },
            child: const Text("Contact Us"),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    title: const Text("Contact Us"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Feel free to reach out to our GAD office for any inquiries or support."),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.email, size: 20),
            SizedBox(width: 8),
            Text("gad@batstate-u.edu.ph"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.phone, size: 20),
            SizedBox(width: 8),
            Text("+63 912 345 6789"),
          ],
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text("Close"),
      ),
    ],
  );
}

@override
Widget build(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Row(
        children: [
          Image.asset(
            'assets/photos/survey_logo.png',
            height: 36,
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              isMobile ? "GAD" : "Gender and Development",
              style: AppTextStyles.subtitle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("LOGIN"),
          ),
        ),
      ],
    ),
    body: LayoutBuilder(
  builder: (context, constraints) {
    final isMobile = constraints.maxWidth < 600;

    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
              "assets/photos/desktop-login-HIFI.png",
              fit: BoxFit.cover,
            ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gender and Development - Batangas State University",
                style: AppTextStyles.header2,
              ),
              const SizedBox(height: 12),
              const Text(
                "What is GAD?",
                style: AppTextStyles.header0,
              ),
              const SizedBox(height: 20),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/photos/slider-dec.png',
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 16),
                        _buildLandingPage(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: _buildLandingPage(),
                        ),
                        const SizedBox(width: 24),
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            'assets/photos/slider-dec.png',
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}