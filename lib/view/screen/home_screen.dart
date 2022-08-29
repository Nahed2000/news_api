import 'package:flutter/material.dart';
import 'package:news_app_with_api/api/api_controller.dart';
import 'package:news_app_with_api/api/api_setting.dart';

import '../../model/news.dart';
import '../../model/nvb.dart';
import '../bnv/bnb_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<News>> homeFuture;
  late Future<List<News>> healthFuture;
  late Future<List<News>> scienceFuture;
  late Future<List<News>> sportFuture;
  late Future<List<News>> technologyFuture;

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    homeFuture = ApiController().homeNews(apiUri: ApiSetting.home);
    healthFuture = ApiController().homeNews(apiUri: ApiSetting.health);
    sportFuture = ApiController().homeNews(apiUri: ApiSetting.sports);
    technologyFuture = ApiController().homeNews(apiUri: ApiSetting.technology);
    scienceFuture = ApiController().homeNews(apiUri: ApiSetting.science);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BNV> data = <BNV>[
      BNV(future: homeFuture, title: 'Generals News'),
      BNV(future: healthFuture, title: 'Health News'),
      BNV(future: sportFuture, title: 'Sport News'),
      BNV(future: technologyFuture, title: 'Technology News'),
      BNV(future: scienceFuture, title: 'Science News'),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          data[currentIndex].title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: BNVHome(future: data[currentIndex].future),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.tealAccent,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(currentIndex);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            activeIcon: Icon(Icons.home_filled),
            label: 'General',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            label: 'Health',
            activeIcon: Icon(
              Icons.health_and_safety_rounded,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.sports_bar_outlined,
              color: Colors.black,
            ),
            activeIcon: Icon(Icons.sports),
            label: 'Sport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electric_bolt_outlined),
            label: 'Technology',
            activeIcon: Icon(
              Icons.electric_bolt,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_outlined),
            label: 'Science',
            activeIcon: Icon(Icons.science),
          ),
        ],
      ),
    );
  }
}
