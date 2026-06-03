import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frevolt_team_app/features/auth/data/models/auth_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../core/services/services_barrel.dart';

class SupabaseDatasource {
  final supabase = Supabase.instance.client;

  Future<Either<AppError, Unit>> sendOtp(String mobileNumber) async {
    try {
      final headers = {
        'accept': '*/*',
        'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
        'apikey': dotenv.get('SUPABASE_ANON_KEY'),
        'content-type': 'application/json; charset=utf-8',
        'origin': 'https://frevolt-team-prod.flutterflow.app',
        'priority': 'u=1, i',
        'referer': 'https://frevolt-team-prod.flutterflow.app/',
        'sec-ch-ua':
            '"Chromium";v="148", "Google Chrome";v="148", "Not/A)Brand";v="99"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"macOS"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'cross-site',
        'user-agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36',
      };

      final data = '{\n  "phone": "+91$mobileNumber"\n}';
      final baseUrl = dotenv.get('SUPABASE_URL');
      final url = Uri.parse('$baseUrl/auth/v1/otp');
      await http.post(url, headers: headers, body: data);
      return Right(unit);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    } 
  }

  Future<Either<AppError, AuthUserModel>> verifyOtp(String mobileNumber, String otp) async {
    try {
      final response = await supabase.auth.verifyOTP(
        type: OtpType.sms,
        token: otp,
        phone: '+91$mobileNumber',
      );
      if (response.user == null) {
        return Left(AppError(message: response.toString()));
      }
      return Right(AuthUserModel(
        mobileNumber: mobileNumber,
        id: response.user!.id,
        jwtToken: response.session!.accessToken,
      ));
    } catch (e) {
      return Left(AppError(message: e.toString()) );
    }
  }

  Future<void> logOut() async {
    await supabase.auth.signOut();
  }

  Future<AuthUserModel> getCurrentUser() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception("No user logged in");
    }
    return AuthUserModel(
      mobileNumber: user?.phone ?? "mobileNumber",
      id: user?.id ?? "id",
      jwtToken: supabase.auth.currentSession?.accessToken ?? "jwtToken" 
    );
  }
}
