import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frevolt_team_app/features/auth/presentation/pages/otp_verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  Text("Log In"),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        TextField(
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                            hintText: "Phone number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationPage(),));
                          },
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
                    "By continuing, you agree to the Terms & Conditions \nTnCs, License Agreement, Privacy Policy",
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
