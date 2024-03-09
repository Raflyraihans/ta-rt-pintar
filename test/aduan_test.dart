import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/env/global_var.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Aduan', () async{
    bool isAduan = false;
    const baseUrl = 'https://rt-pintar.imagi.id/api/v1';

    var url = '$baseUrl/complaint';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3J0LXBpbnRhci5pbWFnaS5pZC9hcGkvdjEvbG9naW4td2FyZ2EiLCJpYXQiOjE3MDg2MTIxOTUsImV4cCI6MTc1Mzk3MjE5NSwibmJmIjoxNzA4NjEyMTk1LCJqdGkiOiJwWUdwWVJOekpqSThkTW9sIiwic3ViIjoiNCIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.mWM7tN0HhtBr_O5onNTVEI0VxH1Lql-raZTpvFfUP5A'
      };
    
    var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['complaint'];
      List complaint = [];

      for (var item in data) {
        complaint.add(Complaint.fromJson(item));
      }
      print(complaint);
      isAduan = true;
      } else {
        throw Exception('Gagal Get Aduan!');
      }
      expect(isAduan, true);
  });
}
