import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frevolt_team_app/core/components/custom_button.dart';
import 'package:frevolt_team_app/core/navigation/routes.dart';
import 'package:frevolt_team_app/core/services/services_barrel.dart';
import 'package:frevolt_team_app/features/auth/auth_provider.dart';
import 'package:frevolt_team_app/features/auth/presentation/components/otp_input_field.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationPage extends ConsumerStatefulWidget {
  final String mobileNumber;

  const OtpVerificationPage({
    super.key,
    required this.mobileNumber,
  });

  @override
  ConsumerState<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState
    extends ConsumerState<OtpVerificationPage> {
  String otp = '';

  @override
  void initState() {
    super.initState();

    
  }

  Future<void> _verifyOtp() async {
    if (otp.length != 6) {
      showCustomToast(
        context,
        AppError(
          message: "Please enter a valid 6-digit OTP",
        ),
        ToastificationType.error,
      );
      return;
    }

   final result = await ref
    .read(authNotifierProvider.notifier)
    .verifyOtp(
      widget.mobileNumber,
      otp,
    );

result.match(
  (error) => showCustomToast(
    context,
    error,
    ToastificationType.error,
  ),
  (_) => context.go(AppRoutes.home),
);
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
                    constraints: const BoxConstraints(
                      maxHeight: 400,
                      maxWidth: 400,
                    ),
                    child: Image.asset(
                      'assets/images/frevolt_logo.png',
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "OTP Verification\nEnter OTP sent to your phone number",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff023a96),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Column(
                      children: [
                        OtpInputField(
                          length: 6,
                          onChange: (value) {
                            setState(() {
                              otp = value;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: "Verify",
                          height: 50,
                          width: double.infinity,
                          isLoading: authState.isLoading,
                          backgroundColor: const Color(0xff023a96),
                          textColor: Colors.white,
                          onPressed: _verifyOtp,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Didn't receive an OTP?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff023a96),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "00:30",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff023a96),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 500,
              maxWidth: 500,
            ),
            child: Image.asset(
              'assets/images/login_page_top_overlay.png',
              fit: BoxFit.fill,
              alignment: const Alignment(-1.0, -1.0),
            ),
          ),
        ],
      ),
    );
  }
}