import 'package:cryptocurrencyapp/models/crypto_model.dart';
import 'package:dio/dio.dart';

import 'api_response.dart';

// Use the dio plugin to fetch data from API

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";

  Future<ApiResponse<List<CryptoModel>>> fetchCryptoList() async {
    try {
      Response response = await _dio.get(_url);
      //print(response);
      if ((response.statusCode! >= 200 || response.statusCode! < 300) && response.data is List) {

          final data = response.data.map<CryptoModel>((e) => CryptoModel.fromJson(e as Map<String, dynamic>)).toList();
          print(data.runtimeType);
          return ApiResponse<List<CryptoModel>>(isSuccessful: true, body: data);
        } else {
        return ApiResponse<List<CryptoModel>>(isSuccessful: false, errorMessage: "Data not Found. Please check connection" );
      }

      //return response.data?.Map CryptoModel.fromJson();
    } catch (error, stackTrace) {
      print("Exception occurred: $error stackTrace: $stackTrace");
      return ApiResponse<List<CryptoModel>>(isSuccessful: false, errorMessage: "Data not Found. Please check connection!" );
      //return CryptoModel.withError("Data not Found. Please check connection");
    }
  }
}