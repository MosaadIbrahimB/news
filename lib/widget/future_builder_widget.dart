import 'package:flutter/material.dart';

import '../api/api_control.dart';
import '../model/article_model.dart';
import '../model/news_response.dart';
import 'article_widget.dart';

class FutureBuilderWidget extends StatelessWidget {
  String? category;
  FutureBuilderWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponseModel>(
      future: ApiControl.getNewsEverything(category: category),
      builder:
          (BuildContext context, AsyncSnapshot<NewsResponseModel> snapshot) {
        String? message = snapshot.data?.message;
        List<ArticlesModel> articlesList = snapshot.data?.articles ?? [];
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (message != null) {
          return Center(child: Container(
              padding: const EdgeInsets.all(15),
              child: Text(message,style: const TextStyle(
                fontSize: 18,
              ),),
          ),);
        }
        return ListView.builder(
            itemCount: articlesList.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                articlesModel: articlesList[index],
              );
            });
      },
    );
  }
}
