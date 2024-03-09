import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/env/global_var.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Login', () async{
    bool isLogin = false;
    const baseUrl = 'https://rt-pintar.imagi.id/api/v1';

    var url = '$baseUrl/login-warga';

    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'phone_number': '081234567800',
      'password': 'warga123',
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      print(data);
      isLogin = true;
    } else {
      throw Exception('Gagal Masuk!!');
    }
    expect(isLogin, true);
  });
}
