
import 'package:flutter/material.dart';

import '../../model/news.dart';
import '../screen/details_screen.dart';

class BNVHome extends StatelessWidget {
  const BNVHome({
    Key? key,
    required Future<List<News>> future,
  }) : _future = future, super(key: key);

  final Future<List<News>> _future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(data: snapshot.data![index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: snapshot.data![index].urlToImage != null,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              snapshot.data![index].urlToImage ?? '',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              snapshot.data![index].author ?? 'Anonymous',
                            ),
                          ),
                          const SizedBox(height: 18)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                Text("you don't have any News ..!"),
              ],
            ),
          );
        }
      },
    );
  }
}
