import 'package:frevolt_team_app/features/auth/data/datasource/supabase_datasource.dart';
import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';
import 'package:frevolt_team_app/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/services/services_barrel.dart';

class AuthRepositoryImpl implements AuthRepository{
  final datasource = SupabaseDatasource();
  @override
  Future<AuthUserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async{
    await datasource.logOut();
  }

  @override
Future<Either<AppError, Unit>> sendOtp(String mobileNumber) {
  return datasource.sendOtp(mobileNumber);
}

@override
Future<Either<AppError, AuthUserEntity>> verifyOtp(
  String mobileNumber,
  String otp,
) async {
  final result = await datasource.verifyOtp(
    mobileNumber,
    otp,
  );

  return result.map(
    (model) => model.toEntity(),
  );
}
}