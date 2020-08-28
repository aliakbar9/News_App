import 'package:flutter/material.dart';
import 'package:news_app/category_item.dart';
import 'package:news_app/models/ResponseNews.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/news_item.dart';

class NewsPage extends StatelessWidget {
  ResponseNews responseNews;
  List<Category> categories;

  NewsPage(this.responseNews, this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      categoryName: categories[index].categoryImage,
                      imageAssetUrl: categories[index].imageUrl,
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount: responseNews.articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsItem(
                      imgUrl: responseNews.articles[index].urlToImage ?? "",
                      title: responseNews.articles[index].title ?? "",
                      desc: responseNews.articles[index].description ?? "",
                      content: responseNews.articles[index].content ?? "",
                      posturl: responseNews.articles[index].url ?? "",
                      name: responseNews.articles[index].source.name ?? "",
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
