// To parse this JSON data, do
//
//     final yuGiOh = yuGiOhFromJson(jsonString);

import 'dart:convert';

YuGiOh yuGiOhFromJson(String str) => YuGiOh.fromJson(json.decode(str));

String yuGiOhToJson(YuGiOh data) => json.encode(data.toJson());

class YuGiOh {
  List<Datum>? data;

  YuGiOh({
    this.data,
  });

  factory YuGiOh.fromJson(Map<String, dynamic> json) => YuGiOh(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? type;
  String? frameType;
  String? desc;
  int? atk;
  int? def;
  int? level;
  String? race;
  String? attribute;
  List<CardSet>? cardSets;
  List<CardImage>? cardImages;
  List<CardPrice>? cardPrices;

  Datum({
    this.id,
    this.name,
    this.type,
    this.frameType,
    this.desc,
    this.atk,
    this.def,
    this.level,
    this.race,
    this.attribute,
    this.cardSets,
    this.cardImages,
    this.cardPrices,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    frameType: json["frameType"],
    desc: json["desc"],
    atk: json["atk"],
    def: json["def"],
    level: json["level"],
    race: json["race"],
    attribute: json["attribute"],
    cardSets: json["card_sets"] == null ? [] : List<CardSet>.from(json["card_sets"]!.map((x) => CardSet.fromJson(x))),
    cardImages: json["card_images"] == null ? [] : List<CardImage>.from(json["card_images"]!.map((x) => CardImage.fromJson(x))),
    cardPrices: json["card_prices"] == null ? [] : List<CardPrice>.from(json["card_prices"]!.map((x) => CardPrice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "frameType": frameType,
    "desc": desc,
    "atk": atk,
    "def": def,
    "level": level,
    "race": race,
    "attribute": attribute,
    "card_sets": cardSets == null ? [] : List<dynamic>.from(cardSets!.map((x) => x.toJson())),
    "card_images": cardImages == null ? [] : List<dynamic>.from(cardImages!.map((x) => x.toJson())),
    "card_prices": cardPrices == null ? [] : List<dynamic>.from(cardPrices!.map((x) => x.toJson())),
  };
}

class CardImage {
  int? id;
  String? imageUrl;
  String? imageUrlSmall;
  String? imageUrlCropped;

  CardImage({
    this.id,
    this.imageUrl,
    this.imageUrlSmall,
    this.imageUrlCropped,
  });

  factory CardImage.fromJson(Map<String, dynamic> json) => CardImage(
    id: json["id"],
    imageUrl: json["image_url"],
    imageUrlSmall: json["image_url_small"],
    imageUrlCropped: json["image_url_cropped"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "image_url_small": imageUrlSmall,
    "image_url_cropped": imageUrlCropped,
  };
}

class CardPrice {
  String? cardmarketPrice;
  String? tcgplayerPrice;
  String? ebayPrice;
  String? amazonPrice;
  String? coolstuffincPrice;

  CardPrice({
    this.cardmarketPrice,
    this.tcgplayerPrice,
    this.ebayPrice,
    this.amazonPrice,
    this.coolstuffincPrice,
  });

  factory CardPrice.fromJson(Map<String, dynamic> json) => CardPrice(
    cardmarketPrice: json["cardmarket_price"],
    tcgplayerPrice: json["tcgplayer_price"],
    ebayPrice: json["ebay_price"],
    amazonPrice: json["amazon_price"],
    coolstuffincPrice: json["coolstuffinc_price"],
  );

  Map<String, dynamic> toJson() => {
    "cardmarket_price": cardmarketPrice,
    "tcgplayer_price": tcgplayerPrice,
    "ebay_price": ebayPrice,
    "amazon_price": amazonPrice,
    "coolstuffinc_price": coolstuffincPrice,
  };
}

class CardSet {
  String? setName;
  String? setCode;
  String? setRarity;
  String? setRarityCode;
  String? setPrice;

  CardSet({
    this.setName,
    this.setCode,
    this.setRarity,
    this.setRarityCode,
    this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) => CardSet(
    setName: json["set_name"],
    setCode: json["set_code"],
    setRarity: json["set_rarity"],
    setRarityCode: json["set_rarity_code"],
    setPrice: json["set_price"],
  );

  Map<String, dynamic> toJson() => {
    "set_name": setName,
    "set_code": setCode,
    "set_rarity": setRarity,
    "set_rarity_code": setRarityCode,
    "set_price": setPrice,
  };
}
