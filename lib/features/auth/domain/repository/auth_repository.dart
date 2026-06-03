import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/services/services_barrel.dart';

abstract class AuthRepository {
  Future<Either<AppError, Unit>> sendOtp(String mobileNumber);

  Future<Either<AppError, AuthUserEntity>> verifyOtp(
    String mobileNumber,
    String otp,
  );

  Future<void> logOut();

  Future<AuthUserEntity> getCurrentUser();
}