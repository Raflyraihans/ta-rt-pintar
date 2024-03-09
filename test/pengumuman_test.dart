import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rtkita/app/model/announcement.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/env/global_var.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Pengumuman', () async{
    bool isPengumuman = false;
    const baseUrl = 'https://rt-pintar.imagi.id/api/v1';

    var url = '$baseUrl/notices';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3J0LXBpbnRhci5pbWFnaS5pZC9hcGkvdjEvbG9naW4td2FyZ2EiLCJpYXQiOjE3MDIyNzI3OTksImV4cCI6MTc0NzYzMjc5OSwibmJmIjoxNzAyMjcyNzk5LCJqdGkiOiJTTzFKbzZFZHlZTVQyT1BkIiwic3ViIjoiMSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.5GMieLv8MLPJdYKIAt4DqBsC7qMmNPipoIooinASgXE'
    };
    
    var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data']['notice'];
        List announcement = [];
        for (var item in data) {
          announcement.add(Announcement.fromJson(item));
        }
        print(announcement);
        isPengumuman = true;
      } else {
        throw Exception('Gagal Get Pengumuman!');
      }
      expect(isPengumuman, true);
  });
}