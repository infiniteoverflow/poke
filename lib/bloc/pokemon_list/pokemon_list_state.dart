part of 'pokemon_list_bloc.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState.initial() = _Initial;
  const factory PokemonListState.loading() = _Loading;
  const factory PokemonListState.loaded(PokemonSearchResult pokemonResult) = _Loaded;
  const factory PokemonListState.error(String message) = _Error;
}
