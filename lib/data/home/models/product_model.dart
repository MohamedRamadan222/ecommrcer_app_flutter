class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String thumbnail;
  final AvailabilityStatus availabilityStatus;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.thumbnail,
    required this.availabilityStatus,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'غير معروف',
      description: json['description'] ?? 'لا يوجد وصف',
      category: json['category'] ?? 'غير مصنف',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'غير معروف',
      thumbnail: json['thumbnail'] ?? '',
      availabilityStatus: _parseAvailabilityStatus(json['availabilityStatus']),
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }
}

enum AvailabilityStatus { inStock, lowStock, outOfStock }

AvailabilityStatus _parseAvailabilityStatus(String? status) {
  switch (status) {
    case 'In Stock':
      return AvailabilityStatus.inStock;
    case 'Low Stock':
      return AvailabilityStatus.lowStock;
    case 'Out of Stock':
      return AvailabilityStatus.outOfStock;
    default:
      return AvailabilityStatus.inStock;
  }
}
