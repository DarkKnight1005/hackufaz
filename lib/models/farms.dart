import 'package:meta/meta.dart';
import 'dart:convert';

List<Farms> farmsFromJson(String str) => List<Farms>.from(json.decode(str).map((x) => Farms.fromJson(x)));

String farmsToJson(List<Farms> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Farms {
    Farms({
        required this.id,
        required this.region,
        required this.farmer,
        required this.nFields,
        required this.ha,
        required this.autumn,
        required this.spring,
        required this.seeding,
        required this.planting,
        required this.irrigation,
        required this.cultivation,
        required this.fertilizing,
        required this.topping,
        required this.efficiency,
        required this.quality,
        required this.index,
    });

    final int id;
    final Region region;
    final String farmer;
    final int nFields;
    final double ha;
    final int autumn;
    final int spring;
    final int seeding;
    final int planting;
    final int irrigation;
    final int cultivation;
    final int fertilizing;
    final int topping;
    final int efficiency;
    final int quality;
    final int index;

    factory Farms.fromJson(Map<String, dynamic> json) => Farms(
        id: json["id"],
        region: regionValues.map[json["region"]]!,
        farmer: json["farmer"],
        nFields: json["n_fields"],
        ha: json["ha"].toDouble(),
        autumn: json["autumn"],
        spring: json["spring"],
        seeding: json["seeding"],
        planting: json["planting"],
        irrigation: json["irrigation"],
        cultivation: json["cultivation"],
        fertilizing: json["fertilizing"],
        topping: json["topping"],
        efficiency: json["efficiency"],
        quality: json["quality"],
        index: json["index"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "region": regionValues.reverse[region],
        "farmer": farmer,
        "n_fields": nFields,
        "ha": ha,
        "autumn": autumn,
        "spring": spring,
        "seeding": seeding,
        "planting": planting,
        "irrigation": irrigation,
        "cultivation": cultivation,
        "fertilizing": fertilizing,
        "topping": topping,
        "efficiency": efficiency,
        "quality": quality,
        "index": index,
    };
}

enum Region { QAKH, SHAKI, ZAQATALA }

final regionValues = EnumValues({
    "Qakh": Region.QAKH,
    "Shaki": Region.SHAKI,
    "Zaqatala": Region.ZAQATALA
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
