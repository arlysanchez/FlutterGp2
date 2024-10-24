import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shopy_file_gp2/src/data/api/ApiConfig.dart';
import 'package:shopy_file_gp2/src/domain/models/Product.dart';
import 'package:shopy_file_gp2/src/domain/utils/ListToString.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class ProductsService {
  Future<String> token;

  ProductsService(this.token);

  Future<Resource<Product>> create(Product product, List<File> files) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products');

      final request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]',
            http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('image', 'jpg')));
      });
      request.fields['name'] = product.name;
      request.fields['description'] = product.description;
      request.fields['price'] = product.price.toString();
      request.fields['id_category'] = product.idCategory.toString();
      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<List<Product>>> getProductsByCategory(int idCategory) async {
    try {
      Uri url =
          Uri.http(ApiConfig.API_ECOMMERCE, '/products/category/$idCategory');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Product> products = Product.fromJsonList(data);
        return Success(products);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> update(int id, Product product) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode({
        'name': product.name,
        'description': product.description,
        'price': product.price,
      });
      final response = await http.put(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<Product>> updateImage(int id, Product product,
      List<File> files, List<int> imagesToUpdate) async {
    try {
      // http://192.168.80.13:3000/users/5
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/upload/$id');

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      files.forEach((file) async {
        request.files.add(http.MultipartFile('files[]',
            http.ByteStream(file.openRead().cast()), await file.length(),
            filename: basename(file.path),
            contentType: MediaType('image', 'jpg')));
      });
      request.fields['name'] = product.name;
      request.fields['description'] = product.description;
      request.fields['price'] = product.price.toString();
      request.fields['images_to_update'] =
          json.encode(imagesToUpdate); // ['0', '1']
      final response = await request.send();
      final data =
          json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Product productResponse = Product.fromJson(data);
        return Success(productResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<bool>> delete(int id) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, '/products/$id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.delete(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Success(true);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
