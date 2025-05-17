import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/detail.dart';

import 'model/posts_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<NewsResponse> getApi() async {
    final response = await http.get(Uri.parse("https://api.thenewsapi.com/v1/news/top?api_token=RvaH6Fi61kbHprelLmzRryvS8FyXRzLbj60ZH8PO&language=en&locale=us,gb,ca,au&limit=3"));
      var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      NewsResponse news = NewsResponse.fromJson(data);
      return news;

    } else {
      throw Exception("Failed to load data");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Column(
        children: [
          FutureBuilder<NewsResponse>(
            future: getApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.data!.isEmpty) {
                return Center(child: Text("No articles available"));
              }

              return Expanded(
                child: InkWell(

                  child: ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {

                      return Column(
                        children:[
                          Divider(),
                          ListTile(
                          leading:Image.network(snapshot.data!.data![index].imageUrl!, width: 80, height: 90, fit: BoxFit.cover)
                              ,
                          title: Text(snapshot.data!.data![index].title.toString()),
                          // subtitle: Text(snapshot.data!.data![index].snippet ?? "No description",style: TextStyle(fontSize: 13),),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(article: snapshot.data!.data![index] )));
                              },

                        ), ]
                      );
                    },
                  ),
                ),
              );
            },
          )

        ],
      ),
    );
  }
}
