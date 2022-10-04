import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke/models/pokemon.dart';
import 'package:poke/network/api_service.dart';

part 'pokemon_bloc.freezed.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const _Initial()) {
    on<PokemonEvent>(onEventArrive);
    add(const _Started());
  }

  void onEventArrive(PokemonEvent event, Emitter<PokemonState> emit) async {
    await event.when(
      started: () {
        emit(const _Loading());
      },
      fetchPokemonData: (url) async {
        final response = await ApiService.fetchPokemon(url: url);
        response[1] == 200
            ? emit(_Loaded(response[0]))
            : emit(_Error(response[1].toString()));
      },
    );
  }
}
