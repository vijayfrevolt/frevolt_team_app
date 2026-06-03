import 'package:flutter/material.dart';
import 'package:frevolt_team_app/core/services/error/app_error.dart';
import 'package:toastification/toastification.dart';

void showCustomToast(BuildContext context, AppError err, ToastificationType type) {
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(err.message),
    autoCloseDuration: const Duration(seconds: 3),
    type: type,
    style: ToastificationStyle.minimal,
    icon: Icon(getIconForToastType(type)),
    alignment: Alignment.topLeft,
    
  );
}

IconData getIconForToastType(ToastificationType type) {
  switch (type) {
    case ToastificationType.success:
      return Icons.check;
    case ToastificationType.error:
      return Icons.error;
    case ToastificationType.warning:
      return Icons.warning;
    case ToastificationType.info:
      return Icons.info;
    default:
      return Icons.info;
  }
}