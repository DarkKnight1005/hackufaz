import 'package:meta/meta.dart';
import 'dart:convert';

Farmer farmerFromJson(String str) => Farmer.fromJson(json.decode(str));

String farmerToJson(Farmer data) => json.encode(data.toJson());

class Farmer {
    Farmer({
        this.region,
        required this.farmer,
        this.numberOfField,
        this.ha,
        required this.autumnPloughing,
        required this.springPloughing,
        required this.seeding,
        required this.planting,
        required this.irrigation,
        required this.cultivation,
        required this.fertilizing,
        required this.topping,
        required this.efficiency,
        required this.quality,
    });

    final String? region;
    final FarmerClass farmer;
    final int? numberOfField;
    final int? ha;
    final Ploughing autumnPloughing;
    final Ploughing springPloughing;
    final Seeding seeding;
    final Planting planting;
    final Ation irrigation;
    final Ation cultivation;
    final Fertilizing fertilizing;
    final Topping topping;
    final Efficiency efficiency;
    final Quality quality;

    factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
        region: json["Region"],
        farmer: FarmerClass.fromJson(json["Farmer"]),
        numberOfField: json["NumberOfField"],
        ha: json["HA"],
        autumnPloughing: Ploughing.fromJson(json["AutumnPloughing"]),
        springPloughing: Ploughing.fromJson(json["SpringPloughing"]),
        seeding: Seeding.fromJson(json["Seeding"]),
        planting: Planting.fromJson(json["Planting"]),
        irrigation: Ation.fromJson(json["Irrigation"]),
        cultivation: Ation.fromJson(json["Cultivation"]),
        fertilizing: Fertilizing.fromJson(json["Fertilizing"]),
        topping: Topping.fromJson(json["Topping"]),
        efficiency: Efficiency.fromJson(json["Efficiency"]),
        quality: Quality.fromJson(json["Quality"]),
    );

    Map<String, dynamic> toJson() => {
        "Region": region,
        "Farmer": farmer.toJson(),
        "NumberOfField": numberOfField,
        "HA": ha,
        "AutumnPloughing": autumnPloughing.toJson(),
        "SpringPloughing": springPloughing.toJson(),
        "Seeding": seeding.toJson(),
        "Planting": planting.toJson(),
        "Irrigation": irrigation.toJson(),
        "Cultivation": cultivation.toJson(),
        "Fertilizing": fertilizing.toJson(),
        "Topping": topping.toJson(),
        "Efficiency": efficiency.toJson(),
        "Quality": quality.toJson(),
    };
}

class Ploughing {
    Ploughing({
        this.appliedHa,
        this.date,
        this.depth,
    });

    final double? appliedHa;
    final DateTime? date;
    final int? depth;

    factory Ploughing.fromJson(Map<String, dynamic> json) => Ploughing(
        appliedHa: json["AppliedHA"].toDouble(),
        date: DateTime.parse(json["Date"]),
        depth: json["Depth"],
    );

    Map<String, dynamic> toJson() => {
        "AppliedHA": appliedHa,
        "Date": date?.toIso8601String(),
        "Depth": depth,
    };
}

class Ation {
    Ation({
        this.appliedHa,
        this.numberOfTimes,
    });

    final int? appliedHa;
    final int? numberOfTimes;

    factory Ation.fromJson(Map<String, dynamic> json) => Ation(
        appliedHa: json["AppliedHA"],
        numberOfTimes: json["NumberOfTimes"],
    );

    Map<String, dynamic> toJson() => {
        "AppliedHA": appliedHa,
        "NumberOfTimes": numberOfTimes,
    };
}

class Efficiency {
    Efficiency({
        this.tons,
    });

    final int? tons;

    factory Efficiency.fromJson(Map<String, dynamic> json) => Efficiency(
        tons: json["Tons"],
    );

    Map<String, dynamic> toJson() => {
        "Tons": tons,
    };
}

class FarmerClass {
    FarmerClass({
        this.name,
    });

    final String? name;

    factory FarmerClass.fromJson(Map<String, dynamic> json) => FarmerClass(
        name: json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
    };
}

class Fertilizing {
    Fertilizing({
        this.appliedHa,
        this.integrity,
        this.date,
    });

    final int? appliedHa;
    final bool? integrity;
    final DateTime? date;

    factory Fertilizing.fromJson(Map<String, dynamic> json) => Fertilizing(
        appliedHa: json["AppliedHA"],
        integrity: json["Integrity"],
        date: DateTime.parse(json["Date"]),
    );

    Map<String, dynamic> toJson() => {
        "AppliedHA": appliedHa,
        "Integrity": integrity,
        "Date": date?.toIso8601String(),
    };
}

class Planting {
    Planting({
        this.appliedHa,
        this.date,
        this.plantPopulation,
    });

    final int? appliedHa;
    final DateTime? date;
    final int? plantPopulation;

    factory Planting.fromJson(Map<String, dynamic> json) => Planting(
        appliedHa: json["AppliedHA"],
        date: DateTime.parse(json["Date"]),
        plantPopulation: json["PlantPopulation"],
    );

    Map<String, dynamic> toJson() => {
        "AppliedHA": appliedHa,
        "Date": date?.toIso8601String(),
        "PlantPopulation": plantPopulation,
    };
}

class Quality {
    Quality({
        this.score,
    });

    final int? score;

    factory Quality.fromJson(Map<String, dynamic> json) => Quality(
        score: json["Score"],
    );

    Map<String, dynamic> toJson() => {
        "Score": score,
    };
}

class Seeding {
    Seeding({
        this.intervalCm,
        this.standart,
    });

    final int? intervalCm;
    final bool? standart;

    factory Seeding.fromJson(Map<String, dynamic> json) => Seeding(
        intervalCm: json["IntervalCM"],
        standart: json["Standart"],
    );

    Map<String, dynamic> toJson() => {
        "IntervalCM": intervalCm,
        "Standart": standart,
    };
}

class Topping {
    Topping({
        this.appliedHa,
        this.spraying,
    });

    final int? appliedHa;
    final bool? spraying;

    factory Topping.fromJson(Map<String, dynamic> json) => Topping(
        appliedHa: json["AppliedHA"],
        spraying: json["Spraying"],
    );

    Map<String, dynamic> toJson() => {
        "AppliedHA": appliedHa,
        "Spraying": spraying,
    };
}
