import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../extensions/log_colors_extension.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'https';
  final _host = 'telejob.onrender.com';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: _port,
      path: path,
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  Uri _customerUri({required String path, Map<String, String>? params}) =>
      _mainUri(path: 'customer/$path', queryParameters: params);

  Uri Login() => _customerUri(path: 'Login');
  Uri register() => _customerUri(path: 'Register');
  Uri show_all_offer() => _customerUri(path: 'Offer/Get_All_Offers');
  Uri show_owner_offer(String id) =>
      _customerUri(path: 'Offer/Get_Owner_Offers/$id');
  Uri show_ads() => _customerUri(path: 'Ad/Get_All_Ads');
  Uri add_ad() => _customerUri(path: 'Ad/Add_Ad');
}
