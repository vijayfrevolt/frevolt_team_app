import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frevolt_team_app/core/components/custom_button.dart';
import 'package:frevolt_team_app/core/services/error/app_error.dart';
import 'package:frevolt_team_app/core/navigation/routes.dart';
import 'package:frevolt_team_app/core/services/show_custom_toast.dart';
import 'package:frevolt_team_app/features/auth/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController mobileNumberController;

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

  Future<void> _sendOtp() async {
  if (mobileNumberController.text.length != 10) {
    showCustomToast(
      context,
      AppError(
        message: 'Please enter a valid 10-digit mobile number',
      ),
      ToastificationType.error,
    );
    return;
  }

  final result = await ref
      .read(authNotifierProvider.notifier)
      .sendOtp(mobileNumberController.text);

  if (!mounted) return;

  result.match(
    (error) {
      showCustomToast(
        context,
        error,
        ToastificationType.error,
      );
    },
    (_) {
      context.push(
        AppRoutes.otp,
        extra: mobileNumberController.text,
      );
    },
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
                  const Text("Log In"),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller:
                              mobileNumberController,
                          maxLength: 10,
                          keyboardType:
                              TextInputType.phone,
                          maxLengthEnforcement:
                              MaxLengthEnforcement
                                  .enforced,
                          decoration:
                              const InputDecoration(
                            hintText: "Phone number",
                            border:
                                OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: "Continue",
                          height: 50,
                          width: double.infinity,
                          onPressed: _sendOtp,
                          isLoading:
                              authState.isLoading,
                          backgroundColor:
                              const Color(0xff023a96),
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "By continuing, you agree to the Terms & Conditions \nTnCs, License Agreement, Privacy Policy",
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