import 'package:flutter/material.dart';
import 'package:intelli_click/enterOTP.dart';

class LoginPage1 extends StatelessWidget {
  const LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Top Illustration
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
              child: Center(
                child: Image.asset(
                  'assets/Login with Phone.png',
                  width: size.width * 0.8, // Adjust width to match design
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Log in Title
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.02,left: 20),
              child: Text(
                'Log in',
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Mobile Number Field
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mobile Number',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff8E8E8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(0xFFD1D1D1), // Custom color
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Color(0xFFD1D1D1), // Custom color when focused
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Login Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EnterOtp()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C27FE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // OR Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  'OR',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

              ],
            ),

            const SizedBox(height: 20),

            // Google Login Button


            const SizedBox(height: 20),

            // Register Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have any account? ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF5C27FE),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
