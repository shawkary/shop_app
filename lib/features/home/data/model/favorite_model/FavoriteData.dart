import 'Product.dart';

class FavoriteData {
  FavoriteData({
    this.id,
    this.product,
  });

  FavoriteData.fromJson(dynamic json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  num? id;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }
}
