import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke/bloc/pokemon/pokemon_bloc.dart';
import 'package:poke/models/pokemon_list.dart';

class PokemonTile extends StatelessWidget {
  final Result pokemonResult;
  const PokemonTile({
    Key? key,
    required this.pokemonResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonBloc bloc = BlocProvider.of<PokemonBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocConsumer<PokemonBloc, PokemonState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: () {
                bloc.add(
                    PokemonEvent.fetchPokemonData(pokemonResult.url ?? ''));
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (pokemon) {
                return Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        pokemon.sprites?.frontDefault ?? '',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                );
              },
              error: (message) {
                return Center(
                  child: Text(message),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
