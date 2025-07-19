import 'dart:ui'; // for glossy or blur effect
import 'package:flutter/material.dart';


void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GAD Login',
      home: Loginscreen(),
    );
  }
}

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; //controls whether the password text is hidden(obscured)or visible


// loading circular progress
  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      if (!mounted) return;

      // show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      Navigator.of(context).pop(); // Close loading dialog

      //if (!mounted) return;
      //nagivator.pushReplacement (
      //context,
      //MaterialPageRoute(builder: context) == const yourdartfile()),

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );
    }
  }


// password dialog
void _showForgotPasswordDialog() {
  final emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text("Forgot Password"),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "Enter your email",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final email = emailController.text.trim();

              final validEmailRegex = RegExp(
                r'^\d{2}-\d{5}@g\.batstate-u\.edu\.ph$', //gsuite account
              );

              if (!validEmailRegex.hasMatch(email)) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please enter a valid BatStateU email."),
                  ),
                );
                return;
              }

              Navigator.of(ctx).pop(); // Close forgot password dialog

              if (!mounted) return;

              // Show loading spinner
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(child: CircularProgressIndicator()),
              );

              await Future.delayed(const Duration(seconds: 2));

              if (!mounted) return;
              Navigator.of(context).pop(); // Close loading dialog

              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Reset code sent to $email")),
              );
            },
            child: const Text("Send Code"),
          ),
        ],
      );
    },
  );
}

// eye icon and size for form field  
  InputDecoration _inputDecoration(String label, {bool withToggle = false}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
      fontSize: 13,          
      fontFamily: 'Roboto',   
      color: Colors.black54,  
    ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
      suffixIcon: withToggle
          ? IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            )
          : null,
    );
  }

// username validator
  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (value.length < 9 || value.length > 13) {
      return 'Invalid username';
    }
    final pattern = RegExp(r'^\d{2}-\d+-[a-z]{2,}$'); // Format: 22-00000-std (student)or22-00000-ad(admin)
    if (!pattern.hasMatch(value)) {
      return 'Invalid username';
    }
    return null;
  }


//password validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8 ||
        !value.contains(RegExp(r'[A-Z]')) ||
        !value.contains(RegExp(r'[a-z]')) ||
        !value.contains(RegExp(r'[0-9]')) ||
        !value.contains(RegExp(r'[!@#\$&*~^%()\-_=+{}\[\]:;"<>,.?/]'))) {
      return 'Use at least 1 letter case, number, symbol'; // Format: Dummies23. (must contains at least 1 letter case, number, symbol)
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("photos/desktop-login-HIFI.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ClipRRect( // connected to "import:'dart:ui'", it's add glassmorphic blur
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: isMobile ? screenSize.width * 0.9 : 700,
                  height: isMobile ? null : 450,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(25),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  // for switches layout for mobile vs desktop
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return isMobile
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildLeftPanel(isMobile, isRow: false),
                                _buildRightPanel(isMobile, isRow: false),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(child: _buildLeftPanel(isMobile, isRow: true)),
                                Expanded(child: _buildRightPanel(isMobile, isRow: true)),
                              ],
                            );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// contains logos and greetings
  Widget _buildLeftPanel(bool isMobile, {required bool isRow}) {
    return Container(
      width: isRow ? null : double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE3F3),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          bottomLeft: isRow ? const Radius.circular(20) : Radius.zero,
          topRight: !isRow ? const Radius.circular(20) : Radius.zero,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('photos/logo-BSU.png'), height: 120),
              SizedBox(width: 12),
              Image(image: AssetImage('photos/gad_logo.png'), height: 120),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Welcome to Batangas State University!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 14 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "The Philippines' National Engineering University",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

//contain login form
Widget _buildRightPanel(bool isMobile, {required bool isRow}) {
  return Container(
    width: isRow ? null : double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: const Color(0xFFE8D8FF),
      borderRadius: BorderRadius.only(
        topRight: isRow ? const Radius.circular(20) : Radius.zero,
        bottomRight: isRow ? const Radius.circular(20) : Radius.zero,
        bottomLeft: !isRow ? const Radius.circular(20) : Radius.zero,
      ),
    ),
    child: Stack(
      children: [
        // overlay image 
        Positioned.fill(
          child: Opacity(
            opacity: 0.05,
            child: Image.asset(
              "photos/overlay-women.png",
              fit: BoxFit.cover,
            ),
          ),
        ),

        //form content
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: isMobile ? 22 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _usernameController,
                decoration: _inputDecoration("Username"),
                validator: _usernameValidator,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration("Password", withToggle: true),
                validator: _passwordValidator,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _showForgotPasswordDialog,
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontFamily: 'Sans',
                    color: Colors.black54,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: 'Sans',
                      color: Colors.black87,
                      fontSize: 14,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}