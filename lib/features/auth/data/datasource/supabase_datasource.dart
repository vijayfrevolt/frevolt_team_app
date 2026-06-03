import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frevolt_team_app/features/auth/data/models/auth_user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class SupabaseDatasource {
  final supabase = Supabase.instance.client;

  Future<void> sendOtp(String mobileNumber) async {
    var client = http.Client();
    try {
      final headers = {
        'accept': '*/*',
        'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
        'apikey':dotenv.get('SUPABASE_ANON_KEY'),
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
      final url = Uri.parse(
        '$baseUrl/auth/v1/otp',
      );
      await http.post(url, headers: headers, body: data);
    } catch (e) {
      throw Exception(e);
    } finally {
      client.close();
    }
  }

  Future<void> verifyOtp(int mobileNumber, int otp) async {}

  Future<void> logOut() async {}

  Future<AuthUserModel> getCurrentUser() async {
    return AuthUserModel(
      mobileNumber: "mobileNumber",
      id: "id",
      jwtToken: "jwtToken",
    );
  }
}
