import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    int? id;
    String? name;
    String? thumbnail;
    DateTime? createdAt;
    DateTime? updatedAt;

    CategoryModel({
        this.id,
        this.name,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        thumbnail: json["thumbnail"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
