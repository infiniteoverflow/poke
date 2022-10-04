part of 'pokemon_bloc.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState.initial() = _Initial;
  const factory PokemonState.loading() = _Loading;
  const factory PokemonState.loaded(Pokemon pokemon) = _Loaded;
  const factory PokemonState.error(String message) = _Error;
}
