import 'package:p_boursa/core/unified_api/api_variables.dart';
import 'package:p_boursa/core/unified_api/get_api.dart';
import 'package:p_boursa/features/offers/data/models/offersmodel.dart';

class Offersdatasource {
  Future<OffersModel> show_all_offer() async {
    final getApi = GetApi(
        uri: ApiVariables().show_all_offer(), fromJson: offersModelFromJson);
    return await getApi.callRequest();
  }

  Future<OffersModel> show_owner_offer() async {
    final getApi = GetApi(
        uri: ApiVariables().show_owner_offer('0'),
        fromJson: offersModelFromJson);
    return await getApi.callRequest();
  }
}
