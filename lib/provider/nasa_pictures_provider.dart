import 'package:nasa_pictures/model/nasa_pictures.dart';
import 'package:nasa_pictures/network/nasa_api.dart';
import 'package:riverpod/riverpod.dart';

final nasaPicturesProvider = FutureProvider<List<NasaPictures>>(
  (ref) async {
    final apiService = NasaApi();
    return await apiService.fetchPictures();
  },
);
