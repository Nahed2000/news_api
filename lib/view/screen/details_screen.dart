// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../model/news.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  final News data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              data.title??'',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Author',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            Text(
              data.author??'Failed Author ',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(data.urlToImage!),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              data.description??'',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Content',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.content??'',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
