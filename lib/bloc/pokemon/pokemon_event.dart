part of 'pokemon_bloc.dart';

@freezed
class PokemonEvent with _$PokemonEvent {
  const factory PokemonEvent.started() = _Started;
  const factory PokemonEvent.fetchPokemonData(String url) = _FetchPokemonData;
}