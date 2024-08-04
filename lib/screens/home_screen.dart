import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/screens/detail_screen.dart';
import 'package:nasa_pictures/provider/nasa_pictures_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picturesAsyncValue = ref.watch(nasaPicturesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nasa Pictures',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: picturesAsyncValue.when(
        data: (pictures) => ListView.builder(
          itemCount: pictures.length,
          itemBuilder: (context, index) {
            final picture = pictures[index];
            return ListTile(
              title: Text(picture.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(picture: picture),
                  ),
                );
              },
            );
          },
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
