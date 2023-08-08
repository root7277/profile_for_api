import 'package:http/http.dart' as http;
import 'dart:convert';

import '../class/class.dart';
 

Future<Model> getModel() async {
  Uri url = Uri.parse('https://randomuser.me/api/');

  http.Response response = await http.get(url);

  Map data = jsonDecode(response.body);

  return Model.fromJson(data);
}
