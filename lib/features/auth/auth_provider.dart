import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:frevolt_team_app/core/services/services_barrel.dart';
import 'package:frevolt_team_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:frevolt_team_app/features/auth/domain/entity/auth_user_entity.dart';

class AuthState {
  final bool isLoading;
  final AuthUserEntity? user;

  const AuthState({
    required this.isLoading,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    AuthUserEntity? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

class AuthProvider extends Notifier<AuthState> {
  final repository = AuthRepositoryImpl();

  @override
  AuthState build() {
    return const AuthState(
      isLoading: false,
    );
  }

  Future<Either<AppError, Unit>> sendOtp(
    String mobileNumber,
  ) async {
    state = state.copyWith(isLoading: true);

    final result = await repository.sendOtp(
      mobileNumber,
    );

    state = state.copyWith(isLoading: false);

    return result;
  }

  Future<Either<AppError, AuthUserEntity>> verifyOtp(
    String mobileNumber,
    String otp,
  ) async {
    state = state.copyWith(isLoading: true);

    final result = await repository.verifyOtp(
      mobileNumber,
      otp,
    );

    result.fold(
      (_) {},
      (user) {
        state = state.copyWith(user: user);
      },
    );

    state = state.copyWith(isLoading: false);

    return result;
  }

  Future<void> logOut() async {
    state = state.copyWith(isLoading: true);

    await repository.logOut();

    state = const AuthState(
      isLoading: false,
      user: null,
    );
  }

  Future<AuthUserEntity> getCurrentUser() {
    return repository.getCurrentUser();
  }
}

final authNotifierProvider =
    NotifierProvider<AuthProvider, AuthState>(
  AuthProvider.new,
);