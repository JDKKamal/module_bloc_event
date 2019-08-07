import 'package:module_bloc_event/service/restclient.dart';

abstract class NetworkType {
  RestClient rest;
  NetworkType(this.rest);
}
