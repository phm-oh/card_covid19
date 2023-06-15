// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

List<Province> provinceFromJson(String str) => List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

String provinceToJson(List<Province> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
    int? year;
    int? weeknum;
    String? province;
    int? newCase;
    int? totalCase;
    int? newCaseExcludeabroad;
    int? totalCaseExcludeabroad;
    int? newDeath;
    int? totalDeath;
    DateTime? updateDate;

    Province({
        this.year,
        this.weeknum,
        this.province,
        this.newCase,
        this.totalCase,
        this.newCaseExcludeabroad,
        this.totalCaseExcludeabroad,
        this.newDeath,
        this.totalDeath,
        this.updateDate,
    });

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        year: json["year"],
        weeknum: json["weeknum"],
        province: json["province"],
        newCase: json["new_case"],
        totalCase: json["total_case"],
        newCaseExcludeabroad: json["new_case_excludeabroad"],
        totalCaseExcludeabroad: json["total_case_excludeabroad"],
        newDeath: json["new_death"],
        totalDeath: json["total_death"],
        updateDate: DateTime.parse(json["update_date"]),
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "weeknum": weeknum,
        "province": province,
        "new_case": newCase,
        "total_case": totalCase,
        "new_case_excludeabroad": newCaseExcludeabroad,
        "total_case_excludeabroad": totalCaseExcludeabroad,
        "new_death": newDeath,
        "total_death": totalDeath,
        "update_date": updateDate?.toIso8601String(),
    };
}
