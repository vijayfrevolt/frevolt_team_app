import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';

class AuthUserModel {
  final String mobileNumber;
  final String id;
  final String jwtToken;

  AuthUserModel({required this.id, required this.jwtToken, required this.mobileNumber});
}