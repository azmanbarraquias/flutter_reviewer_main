import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../models/pokemon_list.dart';
import '../services/remote_service.dart';

class HomePagePokemon extends StatefulWidget {
  const HomePagePokemon({super.key});

  @override
  State<HomePagePokemon> createState() => _HomePagePokemonState();
}

class _HomePagePokemonState extends State<HomePagePokemon> {
  PokemonList? pokemonList;
  var isLoaded = false;

  var customCacheMager = CacheManager(Config('customCahceKey',
      stalePeriod: Duration(days: 1), maxNrOfCacheObjects: 2000));

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
        title: Text('Pokemon List: ${pokemonList?.count ?? 0}'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: RefreshIndicator(
          onRefresh: _zxc,
          child: ListView.builder(
              cacheExtent: 1500,
              itemCount: pokemonList?.results?.length,
              itemBuilder: (ctx, index) {
                var currentPokemonList = pokemonList?.results?[index];
                return Card(
                  key: ValueKey(currentPokemonList?.name.toString()),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {},
                    leading: FutureBuilder(
                      future: getUrl(currentPokemonList?.url ?? ''),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return CachedNetworkImage(
                          cacheManager: customCacheMager,
                          imageUrl: snapshot.data ?? '',
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      },
                    ),
                    title: Text(
                      '${index + 1} ${currentPokemonList?.name}' ?? '',
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      currentPokemonList?.url ?? '',
                      maxLines: 2,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }

  getData() async {
    pokemonList = await RemoteService().getPokemonList();
    if (pokemonList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getUrl(String url) async {
    return RemoteService().getPokemon(url);
  }

  Future<void> _zxc() async {
    await Future.delayed(const Duration(seconds: 2));
    getData();
  }
}
