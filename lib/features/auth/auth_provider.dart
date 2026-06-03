import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frevolt_team_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final AuthUserEntity? user;
  final bool otpSent;

  const AuthState({
    required this.isLoading,
    this.error,
    this.user,
    this.otpSent = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    AuthUserEntity? user,
    bool? otpSent,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
      otpSent: otpSent ?? this.otpSent,
    );
  }
}

class AuthProvier extends Notifier<AuthState> {
  final repository = AuthRepositoryImpl();
  @override
AuthState build() {
  return const AuthState(
    isLoading: false,
    otpSent: false,
  );
}

  Future<void> sendOtp(String mobileNumber) async {
  state = state.copyWith(isLoading: true);

  try {
    await repository.sendOtp(mobileNumber);

    state = state.copyWith(
      isLoading: false,
      otpSent: true,
      error: null,
    );
  } catch (e) {
    state = state.copyWith(
      isLoading: false,
      error: e.toString(),
    );
  }
}

  Future<void> verifyOtp(String mobileNumber, int otp) async {}

  Future<void> logOut() async {}

  Future<AuthUserEntity> getCurrentUser() async {
    return AuthUserEntity(
      mobileNumber: "mobileNumber",
      id: "id",
      jwtToken: "jwtToken",
    );
  }
}

final authNotifierProvider = NotifierProvider<AuthProvier, AuthState>(AuthProvier.new);
