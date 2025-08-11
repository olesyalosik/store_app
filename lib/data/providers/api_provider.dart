import 'package:store_app/data/dio/client.dart';
import 'package:store_app/data/entities/_entities.dart';

class ApiProvider {
  final Client _dioClient;

  ApiProvider({required Client dioClient}) : _dioClient = dioClient;


  Future<ProductsList> getProductsList(String url) async{
    final resp =  await _dioClient.get(url);
    return ProductsList.fromJson(resp.data);
    }

  Future<Product> getProductInfo(String url) async{
    final resp = await _dioClient.get(url);
    return Product.fromJson(resp.data);
      }
}