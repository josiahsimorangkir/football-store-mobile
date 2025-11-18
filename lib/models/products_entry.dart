class ProductsEntry {
  String id;
  String name;
  String description;
  int price;
  String category;
  String? thumbnail; // dibuat nullable
  DateTime createdAt;
  bool isFeatured;
  int? userId;

  ProductsEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.thumbnail,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory ProductsEntry.fromJson(Map<String, dynamic> json) => ProductsEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        thumbnail: (json["thumbnail"] == null || json["thumbnail"].toString().trim().isEmpty)
            ? null
            : json["thumbnail"],
        createdAt: DateTime.parse(json["created_at"]),
        isFeatured: json["is_featured"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "thumbnail": thumbnail,
        "created_at": createdAt.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
      };
}
