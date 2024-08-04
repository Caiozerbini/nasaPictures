import 'package:flutter/material.dart';
import 'package:nasa_pictures/model/nasa_pictures.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailScreen extends StatelessWidget {
  final NasaPictures picture;

  const DetailScreen({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          picture.title,
          style: const TextStyle(fontSize: 25),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(
              maxHeight: 350,
            ),
            child: Image.network(
              picture.url,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) {
                  return child;
                } else {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Text(
                  picture.explanation,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
