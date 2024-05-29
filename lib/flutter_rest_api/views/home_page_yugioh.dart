import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/yugioh_card.dart';
import '../services/remote_service.dart';

class HomePageYugiOh extends StatefulWidget {
  const HomePageYugiOh({super.key});

  @override
  State<HomePageYugiOh> createState() => _HomePageYugiOhState();
}

class _HomePageYugiOhState extends State<HomePageYugiOh> {
  YuGiOh? yuGiOhData;
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
        title: Text('YuGiOH, Card Count: ${yuGiOhData?.data?.length ?? 0}'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: yuGiOhData?.data?.length,
            itemBuilder: (ctx, index) {
              var yuGiOhDataC = yuGiOhData?.data?[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {},
                  leading: CachedNetworkImage(
                    imageUrl: yuGiOhDataC?.cardImages?.first.imageUrl ?? '',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    '${index + 1} ${yuGiOhDataC?.name}' ?? '',
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    yuGiOhDataC?.desc ?? '',
                    maxLines: 2,
                  ),
                ),
              );
            }),
      ),
    );
  }

  getData() async {
    yuGiOhData = await RemoteService().getYuGiOh();
    if (yuGiOhData != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}
