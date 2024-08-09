import 'package:p_boursa/core/unified_api/api_variables.dart';
import 'package:p_boursa/core/unified_api/get_api.dart';
import 'package:p_boursa/core/unified_api/post_api.dart';
import 'package:p_boursa/features/add_ad/data/models/add_admodel.dart';

class AddAddatasourece {
  Future<AddAdModel> showadd() async {
    final getApi =
        GetApi(uri: ApiVariables().show_ads(), fromJson: addAdModelFromJson);
    return await getApi.callRequest();
  }

  Future<AddAdModel> addAd() async {
    final postApi = PostApi(
        uri: ApiVariables().add_ad(), fromJson: addAdModelFromJson, body: {});
    return await postApi.callRequest();
  }
}
