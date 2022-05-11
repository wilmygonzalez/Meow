import 'dart:convert';

import 'package:meow/models/cat_model.dart';
import 'package:meow/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class CatService {
  Future<Cat> getCatImageUrl() async {
    final response = await http.get(Uri.parse(apiUrl + apiGifJson));
    final json = jsonDecode(response.body);
    var cat = Cat.fromJson(json);

    return cat;
  }
}
