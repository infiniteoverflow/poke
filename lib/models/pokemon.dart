class Ability {
  String? name;
  String? url;
  bool? isHidden;
  int? slot;

  Ability({
    this.name,
    this.url,
    this.isHidden,
    this.slot,
  });

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['ability']['name'];
    url = json['ability']['url'];
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }
}

class Form {
  String? name;
  String? url;

  Form({
    this.name,
    this.url,
  });

  Form.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}

class GameIndice {
  int? gameIndex;
  String? name;
  String? url;

  GameIndice({
    this.gameIndex,
    this.name,
    this.url,
  });

  GameIndice.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    name = json['version']['name'];
    url = json['version']['url'];
  }
}

class VersionGroup {
  int? levelLearnedAt;
  String? moveLearnedMethodName;
  String? moveLearnedMethodUrl;
  String? versionGroupName;
  String? versionGroupUrl;

  VersionGroup({
    this.levelLearnedAt,
    this.moveLearnedMethodName,
    this.moveLearnedMethodUrl,
    this.versionGroupName,
    this.versionGroupUrl,
  });

  VersionGroup.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnedMethodName = json['move_learn_method']['name'];
    moveLearnedMethodUrl = json['move_learn_method']['url'];
    versionGroupName = json['version_group']['name'];
    versionGroupUrl = json['version_group']['url'];
  }
}

class Move {
  String? name;
  String? url;
  List<VersionGroup>? versionGroupDetails;

  Move({
    this.name,
    this.url,
    this.versionGroupDetails,
  });

  Move.fromJson(Map<String, dynamic> json) {
    name = json['move']['name'];
    url = json['move']['url'];
    if (json['version_group_details'] != null) {
      versionGroupDetails = [];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(VersionGroup.fromJson(v));
      });
    }
  }
}

class Sprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }
}

class Stat {
  int? baseStat;
  int? effort;
  String? statName;
  String? statUrl;

  Stat({
    this.baseStat,
    this.effort,
    this.statName,
    this.statUrl,
  });

  Stat.fromJson(Map<String,dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    statName = json['stat']['name'];
    statUrl = json['stat']['url'];
  }
}

class Type {
  int? slot;
  String? typeName;
  String? typeUrl;

  Type({
    this.slot,
    this.typeName,
    this.typeUrl,
  });

  Type.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    typeName = json['type']['name'];
    typeUrl = json['type']['url'];
  }
}

class Pokemon {
  int? id;
  String? name;
  int? baseExperience;
  int? height;
  bool? isDefault;
  int? order;
  int? weight;
  List<Ability>? abilities;
  List<Form>? forms;
  List<GameIndice>? gameIndices;
  List<Move>? moves;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;

  Pokemon({
    this.id,
    this.name,
    this.baseExperience,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.gameIndices,
    this.moves,
    this.sprites,
    this.stats,
    this.types,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    baseExperience = json['base_experience'];
    height = json['height'];
    isDefault = json['is_default'];
    order = json['order'];
    weight = json['weight'];
    if (json['abilities'] != null) {
      abilities = [];
      json['abilities'].forEach((v) {
        abilities!.add(Ability.fromJson(v));
      });
    }
    if (json['forms'] != null) {
      forms = [];
      json['forms'].forEach((v) {
        forms!.add(Form.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = [];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndice.fromJson(v));
      });
    }
    if (json['moves'] != null) {
      moves = [];
      json['moves'].forEach((v) {
        moves!.add(Move.fromJson(v));
      });
    }
    sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats!.add(Stat.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types!.add(Type.fromJson(v));
      });
    }
  }
}
