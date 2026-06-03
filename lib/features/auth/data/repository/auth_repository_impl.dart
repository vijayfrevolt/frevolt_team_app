import 'package:frevolt_team_app/features/auth/data/datasource/supabase_datasource.dart';
import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';
import 'package:frevolt_team_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final datasource = SupabaseDatasource();
  @override
  Future<AuthUserEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> sendOtp(String mobileNumber) async{
    try {
      await datasource.sendOtp(mobileNumber);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> verifyOtp(String mobileNumber, int otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}