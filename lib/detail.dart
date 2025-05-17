import 'package:flutter/material.dart';
import 'model/posts_model.dart';

class Details extends StatelessWidget {
  final Article article;

  const Details({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title.toString())),  // Show article title
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl ?? "https://via.placeholder.com/150",
                width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(article.title.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(article.description ?? "No description available",
                style: TextStyle(fontSize: 16)),
            Text(article.publishedAt.toString(),style: TextStyle(fontSize: 5),)
          ],
        ),
      ),
    );
  }
}
