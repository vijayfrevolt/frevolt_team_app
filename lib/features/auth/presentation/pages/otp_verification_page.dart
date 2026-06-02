import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  static const lightPinTheme = MaterialPinTheme(
    shape: MaterialPinShape.outlined,
    cellSize: Size(55, 80),
    spacing: 12,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderWidth: 1.5,
    focusedBorderWidth: 2.5,
    fillColor: Colors.white,
    completeFillColor: Colors.white,
    borderColor: Colors.grey,
    focusedBorderColor: Color(0xff023a96),
  );

 @override
  Widget build(BuildContext context) {
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
                        MaterialPinField(
                          length: 6,
                          autoDismissKeyboard: true,
                          enablePaste: true,
                          keyboardType: TextInputType.number,
                          theme: lightPinTheme,
                        ),
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
