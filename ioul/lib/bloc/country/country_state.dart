import 'package:ioul/response/country_response.dart';

import '../../packages/package.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitialState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoading extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoaded extends CountryState {
  //final GenericResponse countryResponse;
  final CountryResponse response;
  const CountryLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class CountryFailure extends CountryState {
  final String message;
  const CountryFailure({required this.message});
  @override
  List<Object> get props => [message];
}
