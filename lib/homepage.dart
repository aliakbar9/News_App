import 'package:flutter/material.dart';
import 'package:news_app/helper/data_category.dart';
import 'package:news_app/helper/data_request.dart';
import 'package:news_app/helper/widget.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/news_page.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot) {
            //Jika api nya mempunyai data
            if (snapshot.hasData) {
              return NewsPage(snapshot.data, categories);
            }
            //jika api nya gagal/error
            else if (snapshot.hasError) {
              return Center(child: Text('Data tidak ditemukan!'));
            }

            return Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 70.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
