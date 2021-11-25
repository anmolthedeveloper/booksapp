import 'dart:convert';

import 'package:http/http.dart' as http;

const OUR_API = 'https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6';

class BooksAppService {
  static Future<List<dynamic>> fetchData() async {
    final parseUrl = Uri.parse(OUR_API);
    final response = await http.get(parseUrl);
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      final rawJsonString = response.body;
      final jsonMap = jsonDecode(rawJsonString);
      return jsonMap['clients'];
    } else {
      return [];
    }
  }
}
