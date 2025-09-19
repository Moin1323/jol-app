import 'package:flutter/material.dart';
import 'package:jol_app/screens/auth/signup_screen.dart';
import 'package:jol_app/screens/bnb/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const Color textBlue = Color(0xFF0734A5);
  static const Color textGreen = Color(0xFF43AC45);
  static const Color textPink = Color(0xFFC42AF8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents overflow
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC0CB), // light pink
              Color(0xFFADD8E6), // light blue
              Color(0xFFE6E6FA), // lavender
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Scrollable content
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120), // Space for bottom elements
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 80),

                    // Title
                    Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Digitalt',
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        color: Color(0xFFF82A87),
                        letterSpacing: 1.4,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Email/Phone
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _inputField(
                        icon: Icons.email_outlined,
                        hint: "EMAIL/PHONE",
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _inputField(
                        icon: Icons.lock_outline,
                        hint: "PASSWORD",
                        obscure: true,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Forgot password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "FORGOT PASSWORD?",
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xFFF82A87),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Divider with OR (pink)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(thickness: 1, color: textPink),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: textPink,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(thickness: 1, color: textPink),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Google button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _socialButton(
                        text: "CONTINUE WITH GMAIL",
                        icon: Image.asset(
                          "lib/assets/images/google.png",
                          height: 22,
                          width: 22,
                        ),
                        onTap: () {
                          _showSocialDialog(context, "Google");
                        },
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Apple button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: _socialButton(
                        text: "CONTINUE WITH APPLE",
                        icon: Image.asset(
                          "lib/assets/images/apple.png",
                          height: 22,
                          width: 22,
                        ),
                        onTap: () {
                          _showSocialDialog(context, "Apple");
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // Bottom fixed elements
              Positioned(
                left: 0,
                right: 0,
                bottom: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Sign in button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textPink,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        ),
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Bottom row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "DON'T HAVE AN ACCOUNT?",
                          style: TextStyle(
                            fontFamily: 'Digitalt',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            // Navigate to signup screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignupScreen()),
                            );
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontFamily: 'Digitalt',
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: textPink,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Input field widget
  static Widget _inputField({
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: textPink, width: 1.4),
        color: Colors.white.withOpacity(0.4),
      ),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(
          fontFamily: 'Digitalt',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: textPink),
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Digitalt',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: textPink,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  // Social button widget (pink text + tap handler)
  static Widget _socialButton({
    required String text,
    required Widget icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: textPink, width: 1.4),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            icon,
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Digitalt',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: textPink,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Social login dialog
  static void _showSocialDialog(BuildContext context, String provider) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            "$provider Login",
            style: const TextStyle(
              fontFamily: 'Digitalt',
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: textPink,
            ),
          ),
          content: Text(
            "This is where $provider authentication will happen.",
            style: const TextStyle(
              fontFamily: 'Digitalt',
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text(
                "CLOSE",
                style: TextStyle(
                  fontFamily: 'Digitalt',
                  fontWeight: FontWeight.w700,
                  color: textPink,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}