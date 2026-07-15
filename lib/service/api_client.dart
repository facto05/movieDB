import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/app_config.dart';

class ApiClient {
  ApiClient._();

  static Map<String, String> get _headers => {
        'Authorization': 'Bearer ${AppConfig.bearerToken}',
        'Content-Type': 'application/json',
      };

  static Future<T> get<T>(String path, T Function(dynamic) parser) async {
    final uri = Uri.parse('${AppConfig.baseUrl}$path');
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return parser(jsonDecode(response.body));
    }
    throw ApiException(response.statusCode, response.body);
  }

  static Future<T> post<T>(
      String path, Map<String, dynamic> body, T Function(dynamic) parser) async {
    final uri = Uri.parse('${AppConfig.baseUrl}$path');
    final response = await http.post(uri, headers: _headers, body: jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return parser(jsonDecode(response.body));
    }
    throw ApiException(response.statusCode, response.body);
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String body;
  ApiException(this.statusCode, this.body);

  @override
  String toString() => 'ApiException($statusCode): $body';
}