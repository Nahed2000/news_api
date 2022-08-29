import 'package:flutter/material.dart';

import 'news.dart';

class BNV {
  final Future<List<News>> future;
  final String title;

  BNV({
    required this.future,
    required this.title,
  });
}
