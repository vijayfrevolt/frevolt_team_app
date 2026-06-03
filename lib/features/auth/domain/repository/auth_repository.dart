import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';

abstract class AuthRepository {
  Future<void> sendOtp(String mobileNumber);

  Future<void> verifyOtp(String mobileNumber, int otp);

  Future<void> logOut();

  Future<AuthUserEntity> getCurrentUser();
}