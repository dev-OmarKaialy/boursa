import 'dart:developer';

import '../extensions/log_colors_extension.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  final _scheme = 'http';
  final _host = 'localhost';
  // final _port = 5000;

  Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: 5555,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  Uri login() => _mainUri(path: 'Auth/Login');
  Uri register() => _mainUri(path: 'Auth/Register');
  Uri show_all_offer() => _mainUri(path: 'Offer/Get_All_Offers');
  Uri show_owner_offer(String id) =>
      _mainUri(path: 'Offer/Get_Owner_Offers/$id');
  Uri show_ads() => _mainUri(path: 'Ad/Get_All_Ads');
  Uri add_ad() => _mainUri(path: 'Ad/Add_Ad');
  Uri getTenders() => _mainUri(path: 'Tender/Get_All_Tenders');
}
