import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/env/global_var.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Manajemen Aduan', () async{
    bool isManajemenAduan = false;
    const baseUrl = 'https://rt-pintar.imagi.id/api/v1';

    var url = '$baseUrl/pengurus-complaint';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3J0LXBpbnRhci5pbWFnaS5pZC9hcGkvdjEvbG9naW4td2FyZ2EiLCJpYXQiOjE3MDg2MTQwNzIsImV4cCI6MTc1Mzk3NDA3MiwibmJmIjoxNzA4NjE0MDcyLCJqdGkiOiJQNWRKNDhMSU81djN0dHNEIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.34G2jSq7jWBDYU2romv2Q3I0a7M4NId4YXzrYU8tmpA'
      };
    
    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['complaint'];
      List complaint = [];
      for (var item in data) {
        complaint.add(Complaint.fromJson(item));
      }
      print(complaint);
      isManajemenAduan = true;
    } else {
      throw Exception('Gagal Get Aduan!');
    }
    expect(isManajemenAduan, true);
  });
}