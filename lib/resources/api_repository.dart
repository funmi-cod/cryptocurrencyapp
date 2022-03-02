import 'package:cryptocurrencyapp/models/crypto_model.dart';
import 'api_provider.dart';
import 'api_response.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<ApiResponse<List<CryptoModel>>> fetchCryptoList() {
    return _provider.fetchCryptoList();
  }
}

class NetworkError extends Error {}