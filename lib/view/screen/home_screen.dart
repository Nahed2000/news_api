import 'package:flutter/material.dart';
import 'package:news_app_with_api/api/api_controller.dart';
import 'package:news_app_with_api/view/screen/details_screen.dart';

import '../../model/news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<News>> _future;

  @override
  void initState() {
    // TODO: implement initState
    _future = ApiController().readNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'News App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<News>>(
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
      ),
    );
  }
}
