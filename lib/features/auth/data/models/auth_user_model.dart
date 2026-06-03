import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';

class AuthUserModel  {
  final String mobileNumber;
  final String id;
  final String jwtToken;

  AuthUserModel({
    required this.id,
    required this.jwtToken,
    required this.mobileNumber,
  });

  factory AuthUserModel.fromEntity(AuthUserEntity entity) {
    return AuthUserModel(
      id: entity.id,
      jwtToken: entity.jwtToken,
      mobileNumber: entity.mobileNumber,
    );
  }

  AuthUserEntity toEntity() {
    return AuthUserEntity(
      id: id,
      jwtToken: jwtToken,
      mobileNumber: mobileNumber,
    );
  }
}
