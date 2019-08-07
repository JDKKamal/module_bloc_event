import 'dart:async';
import 'dart:convert';
import 'package:module_bloc_event/models/brand/brand.dart';
import 'package:module_bloc_event/models/login.dart';
import 'package:module_bloc_event/models/model/model.dart';
import 'package:module_bloc_event/service/abstract/api_service.dart';
import 'package:module_bloc_event/service/network_service_response.dart';
import 'package:module_bloc_event/service/network_type.dart';
import 'package:module_bloc_event/service/restclient.dart';

class NetworkService extends NetworkType implements APIService {
  static final _baseURL = 'http://apicc.quik-e.mobi/';
  static final _mobexURL = "api/";
  final _loginUrl = _baseURL + _mobexURL + 'MobexCheckRetailerLogin';

  final _brandURL = _baseURL + _mobexURL + 'GetAllBrands';
  final _modelURL = _baseURL + _mobexURL + 'GetModelsByBrand';

  Map<String, String> headers = {
    "Content-Type": 'application/json',
    'AUTH_KEY': 'MOBEXLOGIBR8T23'
  };

  NetworkService(RestClient rest) : super(rest);

  @override
  Future<NetworkServiceResponse<LoginResponse>> login(String phoneNumber,
      String password) async {
    var result = await rest.get<LoginResponse>(
        '$_loginUrl?MobileNo=$phoneNumber&Password=$password&EmailId=""',
        headers);
    if (result.mappedResult != null) {
      var res = LoginResponse.fromJson(json.decode(result.mappedResult));
      return new NetworkServiceResponse(
          response: res,
          responseCode: result.networkServiceResponse.responseCode);
    }
    return new NetworkServiceResponse(
        responseCode: result.networkServiceResponse.responseCode);
  }

  @override
  Future<NetworkServiceResponse<BrandResponse>> brand() async{
    var result = await rest.get<BrandResponse>('$_brandURL',
        headers);
    if (result.mappedResult != null) {
      var res = BrandResponse.fromJson(json.decode(result.mappedResult));
      return new NetworkServiceResponse(
          response: res,
          responseCode: result.networkServiceResponse.responseCode);
    }
    return new NetworkServiceResponse(
        responseCode: result.networkServiceResponse.responseCode);
  }

  @override
  Future<NetworkServiceResponse<ModelResponse>> model(int brandId) async{
    print(brandId);
    var result = await rest.get<ModelResponse>('$_modelURL?BrandId=$brandId', //2 Test
        headers);
    if (result.mappedResult != null) {
      var res = ModelResponse.fromJson(json.decode(result.mappedResult));
      return new NetworkServiceResponse(
          response: res,
          responseCode: result.networkServiceResponse.responseCode);
    }
    return new NetworkServiceResponse(
        responseCode: result.networkServiceResponse.responseCode);
  }
}