import 'package:flutter/material.dart';

import '../api/api_control.dart';
import '../model/article_model.dart';
import '../model/news_response.dart';
import 'article_widget.dart';

class FutureBuilderWidget extends StatefulWidget {
  String? category;
  FutureBuilderWidget({this.category});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  late Future<NewsResponseModel> data;

  @override
  void initState() {
    super.initState();
    data = ApiControl.getNewsEverything(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponseModel>(
      future: data,
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
          return Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          );
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
