import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/bloc/pokemon/pokemon_bloc.dart';
import 'package:poke/bloc/pokemon_list/pokemon_list_bloc.dart';
import 'package:poke/ui/home/pokemon_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonListBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<PokemonListBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke'),
      ),
      body: BlocConsumer<PokemonListBloc, PokemonListState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              bloc.add(const PokemonListEvent.fetchPokemonData());
            },
            loaded: (pokemonSearchResult) {},
            error: (statusCode) {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (statusCode) => Center(
              child: Text(statusCode),
            ),
            initial: () => const Center(child: CircularProgressIndicator()),
            loaded: (pokemonSearchResult) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var pokemonResult in pokemonSearchResult.results!)
                        BlocProvider(
                          create: (context) => PokemonBloc(),
                          child: Center(
                            child: SizedBox(
                              height: 200,
                              width: 300,
                              child: PokemonTile(
                                pokemonResult: pokemonResult,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
