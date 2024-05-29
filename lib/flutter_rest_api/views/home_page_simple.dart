import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/remote_service.dart';

class HomePageSimple extends StatefulWidget {
  const HomePageSimple({super.key});

  @override
  State<HomePageSimple> createState() => _HomePageSimpleState();
}

class _HomePageSimpleState extends State<HomePageSimple> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (ctx, index) {
              var post = posts?[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    '${index + 1} ${post?.title}' ?? '',
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    post?.body ?? '',
                    maxLines: 2,
                  ),
                ),
              );
            }),
      ),
    );
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}
