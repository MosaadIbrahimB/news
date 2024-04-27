import 'source_model.dart';
import 'dart:convert';

/// source : {"id":null,"name":"TMZ"}
/// author : "TMZ Staff"
/// title : "Sydney Sweeney Posts Hot Pics with 'Great T**ts' - TMZ"
/// description : "Sydney Sweeney ain't sweatin' the harsh criticism she received from a veteran Hollywood producer about her acting skills and physical appearance."
/// url : "https://www.tmz.com/2024/04/22/sydney-sweeney-jokes-apology-great-breasts-vacation-producer-carol-baum/"
/// urlToImage : "https://imagez.tmz.com/image/e6/16by9/2024/04/22/e6957a91149d40cbb5561af3fe97505c_xl.jpg"
/// publishedAt : "2024-04-22T12:20:40Z"
/// content : "Sydney Sweeney ain't sweatin' the harsh criticism she received from a veteran Hollywood producer about her acting skills and physical appearance.\r\nOn Sunday, the actress posted a series of photos and… [+1341 chars]"

ArticlesModel articlesFromJson(String str) => ArticlesModel.fromJson(json.decode(str));
String articlesToJson(ArticlesModel data) => json.encode(data.toJson());
class ArticlesModel {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticlesModel({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage,
      this.publishedAt, 
      this.content,});

  ArticlesModel.fromJson(dynamic json) {
    source = json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}