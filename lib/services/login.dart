import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String email, String password) async {
  final url = Uri.parse("https://your-api.com/login");
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode({"email": email, "password": password}),
  );

  if (response.statusCode == 200) {
    final body = json.decode(response.body);
    final token = body["token"];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("jwt", token);
    return true;
  } else {
    return false;
  }
}

Future<http.Response> fetchProtectedData() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("jwt");

  final url = Uri.parse("https://your-api.com/protected");
  return http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );
}

Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("jwt");
}

Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey("jwt");
}
