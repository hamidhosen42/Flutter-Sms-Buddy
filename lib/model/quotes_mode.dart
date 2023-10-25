// To parse this JSON data, do
//
//     final quotesModel = quotesModelFromJson(jsonString);

import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
    int? id;
    String? story;
    String? author;
    String? categoryId;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    Category? category;

    QuotesModel({
        this.id,
        this.story,
        this.author,
        this.categoryId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.category,
    });

    factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json["id"],
        story: json["story"],
        author: json["author"],
        categoryId: json["category_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "story": story,
        "author": author,
        "category_id": categoryId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
    };
}

class Category {
    int? id;
    String? name;
    String? thumbnail;
    DateTime? createdAt;
    DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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
