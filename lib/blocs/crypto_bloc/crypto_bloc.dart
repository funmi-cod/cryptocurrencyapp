import 'package:bloc/bloc.dart';
import 'package:cryptocurrencyapp/resources/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:cryptocurrencyapp/models/crypto_model.dart';


part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitial()) {
    final ApiRepository _apiRespository = ApiRepository();

    on<GetCryptoList>((event, emit) async {
      try {
        emit(CryptoLoading());
        final response = await _apiRespository.fetchCryptoList();
        if (response.isSuccessful && response.body != null ) {
          emit(CryptoLoaded(response.body!));
        } else {
          emit(CryptoError(response.errorMessage));
        }


      } on NetworkError {
        emit(const CryptoError("Failed to fetch data. please check your connection"));
      }
    });
  }
}