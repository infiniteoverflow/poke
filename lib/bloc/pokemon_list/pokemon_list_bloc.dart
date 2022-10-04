import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke/models/pokemon_list.dart';
import 'package:poke/network/api_service.dart';

part 'pokemon_list_bloc.freezed.dart';
part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(const _Initial()) {
    on<PokemonListEvent>(onEventArrive);
    add(const _FetchPokemonData());
  }

  void onEventArrive(PokemonListEvent event, Emitter emit) async {
    await event.when(
      started: () {
        emit(const _Loading());
      },
      fetchPokemonData: () async {
        final response = await ApiService.fetchPokemonList();
        if (response[1] != 200) {
          emit(_Error(response[1].toString()));
        } else {
          final pokemonSearchResult = response[0] as PokemonSearchResult;
          emit(_Loaded(pokemonSearchResult));
        }
      },
    );
  }
}
