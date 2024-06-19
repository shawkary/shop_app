import 'Product.dart';

class FavoriteList {
  FavoriteList({
    this.id,
    this.product,
  });

  FavoriteList.fromJson(dynamic json) {
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
