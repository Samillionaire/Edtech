import 'package:flutter/material.dart';
import 'package:intelli_click/congratulations.dart';
import 'package:pinput/pinput.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  String _otp = '';
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Define the default Pin Theme with border at the bottom
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 70,
      textStyle: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    );

    // Define the placeholder style with a visible dash
    final placeholderPinTheme = defaultPinTheme.copyWith(
      textStyle: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),

              // Illustration
              Image.asset(
                'assets/Enter OTP1.png',
                width: size.width * 0.62,
                fit: BoxFit.contain,
              ),

              SizedBox(height: size.height * 0.05),

              // Title: Enter OTP
              const Text(
                'Enter OTP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Subtext: Instructions
              const Text(
                '4 digit code sent to your mobile, please check and confirm the code to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: size.height * 0.01),

              // OTP Input Field using Pinput
              Pinput(
                length: 4,
                defaultPinTheme: placeholderPinTheme, // Placeholder style
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 2),
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme,
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                showCursor: false, // Disable blinking cursor
                preFilledWidget: const Text(
                  '-',
                  style: TextStyle(fontSize: 35, color: Colors.grey),
                ), // Dash when empty
                onChanged: (value) {
                  setState(() {
                    _otp = value;
                    isButtonEnabled = value.length == 4;
                  });
                },
              ),

              SizedBox(height: size.height * 0.05),

              // Submit Button
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Congratualtions()));
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  isButtonEnabled ? Color(0xff5C27FE) : Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 17, horizontal: 120),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                        isButtonEnabled ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Resend OTP Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't get OTP? Resend in ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '04:23',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff5C27FE),
                      fontWeight: FontWeight.bold,
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
