import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frevolt_team_app/core/navigation/routes.dart';
import 'package:frevolt_team_app/features/auth/auth_provider.dart';
import 'package:frevolt_team_app/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController mobileNumberController;

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
  void initState() {
    super.initState();
    mobileNumberController = TextEditingController();
  }

  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
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
                          controller: mobileNumberController,
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
                            ref
                                .read(authNotifierProvider.notifier)
                                .sendOtp('9175507495');
                            authState.otpSent
                                ? context.push(
                                    AppRoutes.otp,
                                    extra: mobileNumberController.text,
                                  )
                                : null;
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
