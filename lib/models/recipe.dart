class RecipeData {
  Recipe? recipe;
  Links? lLinks;

  RecipeData({this.recipe, this.lLinks});

  RecipeData.fromJson(Map<String, dynamic> json) {
    recipe = json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null;
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipe != null) {
      data['recipe'] = recipe!.toJson();
    }
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}

class Recipe {
  String? uri;
  String? label;
  String? image;
  Images? images;
  String? source;
  String? url;
  String? shareAs;
  double? yield;
  List<String>? healthLabels;
  List<String>? cautions;
  List<String>? ingredientLines;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  double? totalTime;
  List<String>? cuisineType;
  List<String>? mealType;
  List<String>? dishType;
  TotalNutrients? totalNutrients;
  TotalDaily? totalDaily;
  List<Digest>? digest;

  Recipe(
      {this.uri,
      this.label,
      this.image,
      this.images,
      this.source,
      this.url,
      this.shareAs,
      this.yield,
      this.healthLabels,
      this.cautions,
      this.ingredientLines,
      this.ingredients,
      this.calories,
      this.totalWeight,
      this.totalTime,
      this.cuisineType,
      this.mealType,
      this.dishType,
      this.totalNutrients,
      this.totalDaily,
      this.digest});

  Recipe.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    label = json['label'];
    image = json['image'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    source = json['source'];
    url = json['url'];
    shareAs = json['shareAs'];
    yield = json['yield'];

    healthLabels = json['healthLabels'].cast<String>();
    cautions = json['cautions'].cast<String>();
    ingredientLines = json['ingredientLines'].cast<String>();
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredients.fromJson(v));
      });
    }
    calories = json['calories'];
    totalWeight = json['totalWeight'];
    totalTime = json['totalTime'];
    cuisineType = json['cuisineType'].cast<String>();
    mealType = json['mealType'].cast<String>();
    dishType = json['dishType'].cast<String>();
    totalNutrients = json['totalNutrients'] != null
        ? TotalNutrients.fromJson(json['totalNutrients'])
        : null;
    totalDaily = json['totalDaily'] != null
        ? TotalDaily.fromJson(json['totalDaily'])
        : null;
    if (json['digest'] != null) {
      digest = <Digest>[];
      json['digest'].forEach((v) {
        digest!.add(Digest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uri'] = uri;
    data['label'] = label;
    data['image'] = image;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['source'] = source;
    data['url'] = url;
    data['shareAs'] = shareAs;
    data['yield'] = yield;

    data['healthLabels'] = healthLabels;
    data['cautions'] = cautions;
    data['ingredientLines'] = ingredientLines;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    data['calories'] = calories;
    data['totalWeight'] = totalWeight;
    data['totalTime'] = totalTime;
    data['cuisineType'] = cuisineType;
    data['mealType'] = mealType;
    data['dishType'] = dishType;
    if (totalNutrients != null) {
      data['totalNutrients'] = totalNutrients!.toJson();
    }
    if (totalDaily != null) {
      data['totalDaily'] = totalDaily!.toJson();
    }
    if (digest != null) {
      data['digest'] = digest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  THUMBNAIL? tHUMBNAIL;
  THUMBNAIL? sMALL;
  THUMBNAIL? rEGULAR;
  THUMBNAIL? lARGE;

  Images({this.tHUMBNAIL, this.sMALL, this.rEGULAR, this.lARGE});

  Images.fromJson(Map<String, dynamic> json) {
    tHUMBNAIL = json['THUMBNAIL'] != null
        ? THUMBNAIL.fromJson(json['THUMBNAIL'])
        : null;
    sMALL = json['SMALL'] != null ? THUMBNAIL.fromJson(json['SMALL']) : null;
    rEGULAR =
        json['REGULAR'] != null ? THUMBNAIL.fromJson(json['REGULAR']) : null;
    lARGE = json['LARGE'] != null ? THUMBNAIL.fromJson(json['LARGE']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tHUMBNAIL != null) {
      data['THUMBNAIL'] = tHUMBNAIL!.toJson();
    }
    if (sMALL != null) {
      data['SMALL'] = sMALL!.toJson();
    }
    if (rEGULAR != null) {
      data['REGULAR'] = rEGULAR!.toJson();
    }
    if (lARGE != null) {
      data['LARGE'] = lARGE!.toJson();
    }
    return data;
  }
}

class THUMBNAIL {
  String? url;
  int? width;
  int? height;

  THUMBNAIL({this.url, this.width, this.height});

  THUMBNAIL.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}

class Ingredients {
  String? text;
  double? quantity;
  String? measure;
  String? food;
  double? weight;
  String? foodCategory;
  String? foodId;
  String? image;

  Ingredients(
      {this.text,
      this.quantity,
      this.measure,
      this.food,
      this.weight,
      this.foodCategory,
      this.foodId,
      this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    quantity = json['quantity'];
    measure = json['measure'];
    food = json['food'];
    weight = json['weight'];
    foodCategory = json['foodCategory'];
    foodId = json['foodId'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['quantity'] = quantity;
    data['measure'] = measure;
    data['food'] = food;
    data['weight'] = weight;
    data['foodCategory'] = foodCategory;
    data['foodId'] = foodId;
    data['image'] = image;
    return data;
  }
}

class TotalNutrients {
  ENERCKCAL? eNERCKCAL;
  ENERCKCAL? fAT;
  ENERCKCAL? fASAT;
  ENERCKCAL? fATRN;
  ENERCKCAL? fAMS;
  ENERCKCAL? fAPU;
  ENERCKCAL? cHOCDF;
  ENERCKCAL? cHOCDFNet;
  ENERCKCAL? fIBTG;
  ENERCKCAL? sUGAR;
  SUGARAdded? sUGARAdded;
  ENERCKCAL? pROCNT;
  SUGARAdded? cHOLE;
  ENERCKCAL? nA;
  ENERCKCAL? cA;
  ENERCKCAL? mG;
  ENERCKCAL? k;
  ENERCKCAL? fE;
  ENERCKCAL? zN;
  ENERCKCAL? p;
  ENERCKCAL? vITARAE;
  ENERCKCAL? vITC;
  ENERCKCAL? tHIA;
  ENERCKCAL? rIBF;
  ENERCKCAL? nIA;
  ENERCKCAL? vITB6A;
  ENERCKCAL? fOLDFE;
  ENERCKCAL? fOLFD;
  SUGARAdded? fOLAC;
  ENERCKCAL? vITB12;
  ENERCKCAL? vITD;
  ENERCKCAL? tOCPHA;
  ENERCKCAL? vITK1;
  SUGARAdded? sugarAlcohol;
  ENERCKCAL? wATER;

  TotalNutrients(
      {this.eNERCKCAL,
      this.fAT,
      this.fASAT,
      this.fATRN,
      this.fAMS,
      this.fAPU,
      this.cHOCDF,
      this.cHOCDFNet,
      this.fIBTG,
      this.sUGAR,
      this.sUGARAdded,
      this.pROCNT,
      this.cHOLE,
      this.nA,
      this.cA,
      this.mG,
      this.k,
      this.fE,
      this.zN,
      this.p,
      this.vITARAE,
      this.vITC,
      this.tHIA,
      this.rIBF,
      this.nIA,
      this.vITB6A,
      this.fOLDFE,
      this.fOLFD,
      this.fOLAC,
      this.vITB12,
      this.vITD,
      this.tOCPHA,
      this.vITK1,
      this.sugarAlcohol,
      this.wATER});

  TotalNutrients.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? ENERCKCAL.fromJson(json['FAT']) : null;
    fASAT = json['FASAT'] != null ? ENERCKCAL.fromJson(json['FASAT']) : null;
    fATRN = json['FATRN'] != null ? ENERCKCAL.fromJson(json['FATRN']) : null;
    fAMS = json['FAMS'] != null ? ENERCKCAL.fromJson(json['FAMS']) : null;
    fAPU = json['FAPU'] != null ? ENERCKCAL.fromJson(json['FAPU']) : null;
    cHOCDF = json['CHOCDF'] != null ? ENERCKCAL.fromJson(json['CHOCDF']) : null;
    cHOCDFNet = json['CHOCDF.net'] != null
        ? ENERCKCAL.fromJson(json['CHOCDF.net'])
        : null;
    fIBTG = json['FIBTG'] != null ? ENERCKCAL.fromJson(json['FIBTG']) : null;
    sUGAR = json['SUGAR'] != null ? ENERCKCAL.fromJson(json['SUGAR']) : null;
    sUGARAdded = json['SUGAR.added'] != null
        ? SUGARAdded.fromJson(json['SUGAR.added'])
        : null;
    pROCNT = json['PROCNT'] != null ? ENERCKCAL.fromJson(json['PROCNT']) : null;
    cHOLE = json['CHOLE'] != null ? SUGARAdded.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? ENERCKCAL.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? ENERCKCAL.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? ENERCKCAL.fromJson(json['MG']) : null;
    k = json['K'] != null ? ENERCKCAL.fromJson(json['K']) : null;
    fE = json['FE'] != null ? ENERCKCAL.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? ENERCKCAL.fromJson(json['ZN']) : null;
    p = json['P'] != null ? ENERCKCAL.fromJson(json['P']) : null;
    vITARAE =
        json['VITA_RAE'] != null ? ENERCKCAL.fromJson(json['VITA_RAE']) : null;
    vITC = json['VITC'] != null ? ENERCKCAL.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? ENERCKCAL.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? ENERCKCAL.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? ENERCKCAL.fromJson(json['NIA']) : null;
    vITB6A = json['VITB6A'] != null ? ENERCKCAL.fromJson(json['VITB6A']) : null;
    fOLDFE = json['FOLDFE'] != null ? ENERCKCAL.fromJson(json['FOLDFE']) : null;
    fOLFD = json['FOLFD'] != null ? ENERCKCAL.fromJson(json['FOLFD']) : null;
    fOLAC = json['FOLAC'] != null ? SUGARAdded.fromJson(json['FOLAC']) : null;
    vITB12 = json['VITB12'] != null ? ENERCKCAL.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? ENERCKCAL.fromJson(json['VITD']) : null;
    tOCPHA = json['TOCPHA'] != null ? ENERCKCAL.fromJson(json['TOCPHA']) : null;
    vITK1 = json['VITK1'] != null ? ENERCKCAL.fromJson(json['VITK1']) : null;
    sugarAlcohol = json['Sugar.alcohol'] != null
        ? SUGARAdded.fromJson(json['Sugar.alcohol'])
        : null;
    wATER = json['WATER'] != null ? ENERCKCAL.fromJson(json['WATER']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eNERCKCAL != null) {
      data['ENERC_KCAL'] = eNERCKCAL!.toJson();
    }
    if (fAT != null) {
      data['FAT'] = fAT!.toJson();
    }
    if (fASAT != null) {
      data['FASAT'] = fASAT!.toJson();
    }
    if (fATRN != null) {
      data['FATRN'] = fATRN!.toJson();
    }
    if (fAMS != null) {
      data['FAMS'] = fAMS!.toJson();
    }
    if (fAPU != null) {
      data['FAPU'] = fAPU!.toJson();
    }
    if (cHOCDF != null) {
      data['CHOCDF'] = cHOCDF!.toJson();
    }
    if (cHOCDFNet != null) {
      data['CHOCDF.net'] = cHOCDFNet!.toJson();
    }
    if (fIBTG != null) {
      data['FIBTG'] = fIBTG!.toJson();
    }
    if (sUGAR != null) {
      data['SUGAR'] = sUGAR!.toJson();
    }
    if (sUGARAdded != null) {
      data['SUGAR.added'] = sUGARAdded!.toJson();
    }
    if (pROCNT != null) {
      data['PROCNT'] = pROCNT!.toJson();
    }
    if (cHOLE != null) {
      data['CHOLE'] = cHOLE!.toJson();
    }
    if (nA != null) {
      data['NA'] = nA!.toJson();
    }
    if (cA != null) {
      data['CA'] = cA!.toJson();
    }
    if (mG != null) {
      data['MG'] = mG!.toJson();
    }
    if (k != null) {
      data['K'] = k!.toJson();
    }
    if (fE != null) {
      data['FE'] = fE!.toJson();
    }
    if (zN != null) {
      data['ZN'] = zN!.toJson();
    }
    if (p != null) {
      data['P'] = p!.toJson();
    }
    if (vITARAE != null) {
      data['VITA_RAE'] = vITARAE!.toJson();
    }
    if (vITC != null) {
      data['VITC'] = vITC!.toJson();
    }
    if (tHIA != null) {
      data['THIA'] = tHIA!.toJson();
    }
    if (rIBF != null) {
      data['RIBF'] = rIBF!.toJson();
    }
    if (nIA != null) {
      data['NIA'] = nIA!.toJson();
    }
    if (vITB6A != null) {
      data['VITB6A'] = vITB6A!.toJson();
    }
    if (fOLDFE != null) {
      data['FOLDFE'] = fOLDFE!.toJson();
    }
    if (fOLFD != null) {
      data['FOLFD'] = fOLFD!.toJson();
    }
    if (fOLAC != null) {
      data['FOLAC'] = fOLAC!.toJson();
    }
    if (vITB12 != null) {
      data['VITB12'] = vITB12!.toJson();
    }
    if (vITD != null) {
      data['VITD'] = vITD!.toJson();
    }
    if (tOCPHA != null) {
      data['TOCPHA'] = tOCPHA!.toJson();
    }
    if (vITK1 != null) {
      data['VITK1'] = vITK1!.toJson();
    }
    if (sugarAlcohol != null) {
      data['Sugar.alcohol'] = sugarAlcohol!.toJson();
    }
    if (wATER != null) {
      data['WATER'] = wATER!.toJson();
    }
    return data;
  }
}

class ENERCKCAL {
  String? label;
  double? quantity;
  String? unit;

  ENERCKCAL({this.label, this.quantity, this.unit});

  ENERCKCAL.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['quantity'] = quantity;
    data['unit'] = unit;
    return data;
  }
}

class SUGARAdded {
  String? label;
  double? quantity;
  String? unit;

  SUGARAdded({this.label, this.quantity, this.unit});

  SUGARAdded.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    quantity = json['quantity'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['quantity'] = quantity;
    data['unit'] = unit;
    return data;
  }
}

class TotalDaily {
  ENERCKCAL? eNERCKCAL;
  ENERCKCAL? fAT;
  ENERCKCAL? fASAT;
  ENERCKCAL? cHOCDF;
  ENERCKCAL? fIBTG;
  ENERCKCAL? pROCNT;
  SUGARAdded? cHOLE;
  ENERCKCAL? nA;
  ENERCKCAL? cA;
  ENERCKCAL? mG;
  ENERCKCAL? k;
  ENERCKCAL? fE;
  ENERCKCAL? zN;
  ENERCKCAL? p;
  ENERCKCAL? vITARAE;
  ENERCKCAL? vITC;
  ENERCKCAL? tHIA;
  ENERCKCAL? rIBF;
  ENERCKCAL? nIA;
  ENERCKCAL? vITB6A;
  ENERCKCAL? fOLDFE;
  ENERCKCAL? vITB12;
  ENERCKCAL? vITD;
  ENERCKCAL? tOCPHA;
  ENERCKCAL? vITK1;

  TotalDaily(
      {this.eNERCKCAL,
      this.fAT,
      this.fASAT,
      this.cHOCDF,
      this.fIBTG,
      this.pROCNT,
      this.cHOLE,
      this.nA,
      this.cA,
      this.mG,
      this.k,
      this.fE,
      this.zN,
      this.p,
      this.vITARAE,
      this.vITC,
      this.tHIA,
      this.rIBF,
      this.nIA,
      this.vITB6A,
      this.fOLDFE,
      this.vITB12,
      this.vITD,
      this.tOCPHA,
      this.vITK1});

  TotalDaily.fromJson(Map<String, dynamic> json) {
    eNERCKCAL = json['ENERC_KCAL'] != null
        ? ENERCKCAL.fromJson(json['ENERC_KCAL'])
        : null;
    fAT = json['FAT'] != null ? ENERCKCAL.fromJson(json['FAT']) : null;
    fASAT = json['FASAT'] != null ? ENERCKCAL.fromJson(json['FASAT']) : null;
    cHOCDF = json['CHOCDF'] != null ? ENERCKCAL.fromJson(json['CHOCDF']) : null;
    fIBTG = json['FIBTG'] != null ? ENERCKCAL.fromJson(json['FIBTG']) : null;
    pROCNT = json['PROCNT'] != null ? ENERCKCAL.fromJson(json['PROCNT']) : null;
    cHOLE = json['CHOLE'] != null ? SUGARAdded.fromJson(json['CHOLE']) : null;
    nA = json['NA'] != null ? ENERCKCAL.fromJson(json['NA']) : null;
    cA = json['CA'] != null ? ENERCKCAL.fromJson(json['CA']) : null;
    mG = json['MG'] != null ? ENERCKCAL.fromJson(json['MG']) : null;
    k = json['K'] != null ? ENERCKCAL.fromJson(json['K']) : null;
    fE = json['FE'] != null ? ENERCKCAL.fromJson(json['FE']) : null;
    zN = json['ZN'] != null ? ENERCKCAL.fromJson(json['ZN']) : null;
    p = json['P'] != null ? ENERCKCAL.fromJson(json['P']) : null;
    vITARAE =
        json['VITA_RAE'] != null ? ENERCKCAL.fromJson(json['VITA_RAE']) : null;
    vITC = json['VITC'] != null ? ENERCKCAL.fromJson(json['VITC']) : null;
    tHIA = json['THIA'] != null ? ENERCKCAL.fromJson(json['THIA']) : null;
    rIBF = json['RIBF'] != null ? ENERCKCAL.fromJson(json['RIBF']) : null;
    nIA = json['NIA'] != null ? ENERCKCAL.fromJson(json['NIA']) : null;
    vITB6A = json['VITB6A'] != null ? ENERCKCAL.fromJson(json['VITB6A']) : null;
    fOLDFE = json['FOLDFE'] != null ? ENERCKCAL.fromJson(json['FOLDFE']) : null;
    vITB12 = json['VITB12'] != null ? ENERCKCAL.fromJson(json['VITB12']) : null;
    vITD = json['VITD'] != null ? ENERCKCAL.fromJson(json['VITD']) : null;
    tOCPHA = json['TOCPHA'] != null ? ENERCKCAL.fromJson(json['TOCPHA']) : null;
    vITK1 = json['VITK1'] != null ? ENERCKCAL.fromJson(json['VITK1']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eNERCKCAL != null) {
      data['ENERC_KCAL'] = eNERCKCAL!.toJson();
    }
    if (fAT != null) {
      data['FAT'] = fAT!.toJson();
    }
    if (fASAT != null) {
      data['FASAT'] = fASAT!.toJson();
    }
    if (cHOCDF != null) {
      data['CHOCDF'] = cHOCDF!.toJson();
    }
    if (fIBTG != null) {
      data['FIBTG'] = fIBTG!.toJson();
    }
    if (pROCNT != null) {
      data['PROCNT'] = pROCNT!.toJson();
    }
    if (cHOLE != null) {
      data['CHOLE'] = cHOLE!.toJson();
    }
    if (nA != null) {
      data['NA'] = nA!.toJson();
    }
    if (cA != null) {
      data['CA'] = cA!.toJson();
    }
    if (mG != null) {
      data['MG'] = mG!.toJson();
    }
    if (k != null) {
      data['K'] = k!.toJson();
    }
    if (fE != null) {
      data['FE'] = fE!.toJson();
    }
    if (zN != null) {
      data['ZN'] = zN!.toJson();
    }
    if (p != null) {
      data['P'] = p!.toJson();
    }
    if (vITARAE != null) {
      data['VITA_RAE'] = vITARAE!.toJson();
    }
    if (vITC != null) {
      data['VITC'] = vITC!.toJson();
    }
    if (tHIA != null) {
      data['THIA'] = tHIA!.toJson();
    }
    if (rIBF != null) {
      data['RIBF'] = rIBF!.toJson();
    }
    if (nIA != null) {
      data['NIA'] = nIA!.toJson();
    }
    if (vITB6A != null) {
      data['VITB6A'] = vITB6A!.toJson();
    }
    if (fOLDFE != null) {
      data['FOLDFE'] = fOLDFE!.toJson();
    }
    if (vITB12 != null) {
      data['VITB12'] = vITB12!.toJson();
    }
    if (vITD != null) {
      data['VITD'] = vITD!.toJson();
    }
    if (tOCPHA != null) {
      data['TOCPHA'] = tOCPHA!.toJson();
    }
    if (vITK1 != null) {
      data['VITK1'] = vITK1!.toJson();
    }
    return data;
  }
}

class Digest {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;
  List<Sub>? sub;

  Digest(
      {this.label,
      this.tag,
      this.schemaOrgTag,
      this.total,
      this.hasRDI,
      this.daily,
      this.unit,
      this.sub});

  Digest.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['tag'] = tag;
    data['schemaOrgTag'] = schemaOrgTag;
    data['total'] = total;
    data['hasRDI'] = hasRDI;
    data['daily'] = daily;
    data['unit'] = unit;
    if (sub != null) {
      data['sub'] = sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  String? label;
  String? tag;
  String? schemaOrgTag;
  double? total;
  bool? hasRDI;
  double? daily;
  String? unit;

  Sub(
      {this.label,
      this.tag,
      this.schemaOrgTag,
      this.total,
      this.hasRDI,
      this.daily,
      this.unit});

  Sub.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    tag = json['tag'];
    schemaOrgTag = json['schemaOrgTag'];
    total = json['total'];
    hasRDI = json['hasRDI'];
    daily = json['daily'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['tag'] = tag;
    data['schemaOrgTag'] = schemaOrgTag;
    data['total'] = total;
    data['hasRDI'] = hasRDI;
    data['daily'] = daily;
    data['unit'] = unit;
    return data;
  }
}

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.toJson();
    }
    return data;
  }
}

class Self {
  String? title;
  String? href;

  Self({this.title, this.href});

  Self.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['href'] = href;
    return data;
  }
}
