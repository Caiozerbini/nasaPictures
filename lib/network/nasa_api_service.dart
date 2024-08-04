import 'dart:convert';

import 'package:nasa_pictures/model/nasa_pictures.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NasaApi {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String _apiKey = 'VVjFoMKcU9HGK6oxaPznTRYBLtsYVI3jnPyQRbGM';

  Future<List<NasaPictures>> fetchPictures() async {
    final DateTime today = DateTime.now();
    final DateTime tenDaysAgo = today.subtract(const Duration(days: 14));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String endDate = formatter.format(today);
    final String startDate = formatter.format(tenDaysAgo);

    final response = await http.get(
      Uri.parse(
          '$_baseUrl?api_key=$_apiKey&start_date=$startDate&end_date=$endDate&thumbs=true'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => NasaPictures.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pictures');
    }
  }
}
