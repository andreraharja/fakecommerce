import 'package:dio/dio.dart';
import 'package:fakecommerce/model/rating_product.dart';

class DataProduct {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RatingProduct? rating;

  DataProduct(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  DataProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? RatingProduct.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }

  final Dio _dio = Dio();

  Future<List<DataProduct>> getDataProduct() async {
    Response response = await _dio.get("https://fakestoreapi.com/products");
    if (response.statusCode == 200) {
      List<DataProduct> dataResult = [];
      response.data
          .map((i) => dataResult.add(DataProduct.fromJson(i)))
          .toList();
      return dataResult;
    } else {
      return [];
    }
  }

  Future<DataProduct> addDataProduct(DataProduct dataProduct) async {
    // Response response = await _dio.post("https://fakestoreapi.com/products", data: );
    Response response = await _dio.request(
      'https://fakestoreapi.com/products',
      data: dataProduct,
      options: Options(method: 'POST'),
    );
    if (response.statusCode == 200) {
      return DataProduct.fromJson(response.data);
    } else {
      return DataProduct();
    }
  }

  Future<DataProduct> updateDataProduct(DataProduct dataProduct) async {
    // Response response = await _dio.post("https://fakestoreapi.com/products", data: );
    Response response = await _dio.request(
      'https://fakestoreapi.com/products/' + dataProduct.id.toString(),
      data: dataProduct,
      options: Options(method: 'PUT'),
    );
    if (response.statusCode == 200) {
      return DataProduct.fromJson(response.data);
    } else {
      return DataProduct();
    }
  }

  Future<DataProduct> deleteDataProduct(int idDataProduct) async {
    // Response response = await _dio.post("https://fakestoreapi.com/products", data: );
    Response response = await _dio.request(
      'https://fakestoreapi.com/products/' + idDataProduct.toString(),
      options: Options(method: 'DELETE'),
    );
    if (response.statusCode == 200) {
      return DataProduct.fromJson(response.data);
    } else {
      return DataProduct();
    }
  }
}
