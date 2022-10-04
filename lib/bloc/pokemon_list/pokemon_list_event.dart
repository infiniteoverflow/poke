part of 'pokemon_list_bloc.dart';

@freezed
class PokemonListEvent with _$PokemonListEvent {
  const factory PokemonListEvent.started() = _Started;
  const factory PokemonListEvent.fetchPokemonData() = _FetchPokemonData;
}
