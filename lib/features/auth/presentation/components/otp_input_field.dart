import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputField extends StatelessWidget {
  final int length;
  final Function(String otp) onSubmit;
  const OtpInputField({super.key, required this.length, required this.onSubmit});

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
    return MaterialPinField(
      length: 6,
      autoDismissKeyboard: true,
      enablePaste: true,
      keyboardType: TextInputType.number,
      theme: lightPinTheme,
      onSubmitted: (value) {
        onSubmit(value);
      },
    );
  }
}
