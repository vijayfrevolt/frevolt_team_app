import 'package:flutter/material.dart';
import 'package:frevolt_team_app/features/auth/presentation/components/otp_input_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  final String mobileNumber;
  const OtpVerificationPage({super.key, required this.mobileNumber});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {

 @override
  Widget build(BuildContext context) {
    String otp;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400, maxWidth: 400),
                    child: Image.asset('assets/images/frevolt_logo.png'),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "OTP Verification\nEnter OTP sent to your phone number",
                    style: TextStyle(fontSize: 16, color: Color(0xff023a96)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        OtpInputField(length: 6, onSubmit: (otp){setState(() {
                          otp = otp;
                        });}),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff023a96),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: AlignmentGeometry.center,
                              child: Text(
                                "Continue",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Didn\'t receive an OTP?",
                    style: TextStyle(fontSize: 12, color: Color(0xff023a96)),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "00:30",
                    style: TextStyle(fontSize: 12, color: Color(0xff023a96)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500, maxWidth: 500),
            child: Image.asset(
              'assets/images/login_page_top_overlay.png',
              fit: BoxFit.fill,
              alignment: Alignment(-1.0, -1.0),
            ),
          ),
        ],
      ),
    );
  }
}
