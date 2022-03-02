part of 'crypto_bloc.dart';



abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object?> get props => [];
}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final List<CryptoModel> data;
  const CryptoLoaded(this.data);
}

class CryptoError extends CryptoState {
  final String? message;
  const CryptoError(this.message);
}

