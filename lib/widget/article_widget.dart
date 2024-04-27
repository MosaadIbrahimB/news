import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/article_model.dart';

class ArticleWidget extends StatelessWidget {
  ArticlesModel articlesModel;
  ArticleWidget({required this.articlesModel});

  @override
  Widget build(BuildContext context) {


    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                color: Colors.grey[100],
                height: 200,
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: articlesModel.urlToImage ?? "",
                  placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              articlesModel.title ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "PoppinsBold",
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              " ${articlesModel.description ?? ""}     ",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "PoppinsMedium",
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text((articlesModel.publishedAt)?.substring(0, 10) ?? ""),
              ],
            ),
          ],
        ),
      ),
    );


    // return articlesModel.urlToImage == null
    //     ? const SizedBox()
    //     :
  }
}
