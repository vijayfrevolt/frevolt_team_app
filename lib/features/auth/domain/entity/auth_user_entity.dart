class AuthUserEntity {
  final String mobileNumber;
  final String id;
  final String jwtToken;

  AuthUserEntity({
    required this.mobileNumber,
    required this.id,
    required this.jwtToken,
  });

  AuthUserEntity copyWith({
    String? mobileNumber,
    String? id,
    String? jwtToken,
  }) {
    return AuthUserEntity(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      id: id ?? this.id,
      jwtToken: jwtToken ?? this.jwtToken,
    );
  }
}
