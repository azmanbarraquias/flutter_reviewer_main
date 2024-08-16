import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../utils/xprint.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> signup({String? email, String? password}) async {
    const urlLink = 'www.googleapis.com/identitytoolkit.googleapis.com';
    const apiKey = 'AIzaSyBaPu0Z2P1rU3GQI-MqHM5EbETUpeiT-w4';

    try {
      final url = Uri.https(urlLink, '/v1/accounts:signUp?key=$apiKey');
      final bodyJson = json.encoder.convert({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      });
      xPrint('signup body: $bodyJson');
      final response = await http.post(url, body: bodyJson);

      xPrint('signup status: ${response.statusCode}');
      xPrint('signup response: ${response.body}');
      //
      // if (response.statusCode >= 400) {}
    } catch (error) {
      xPrint('signup error: $error');
    }
  }
}
