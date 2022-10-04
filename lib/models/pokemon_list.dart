class Result {
  final String? name;
  final String? url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      name: json['name'],
      url: json['url'],
    );
  }
}

class PokemonSearchResult {
  final List<Result>? results;
  final int? count;
  final String? next;
  final String? previous;

  PokemonSearchResult({
    this.results,
    this.count,
    this.next,
    this.previous,
  });

  factory PokemonSearchResult.fromJson(Map<String, dynamic> json) {
    return PokemonSearchResult(
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
    );
  }
}
