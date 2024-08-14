import 'package:p_boursa/core/unified_api/api_variables.dart';
import 'package:p_boursa/core/unified_api/get_api.dart';
import 'package:p_boursa/core/unified_api/post_api.dart';
import 'package:p_boursa/features/add_ad/data/models/add_admodel.dart';
import 'package:p_boursa/features/add_ad/data/models/tender_model.dart';

class AddAddatasourece {
  Future<List<AddAdModel>> showadd() async {
    final getApi =
        GetApi(uri: ApiVariables().show_ads(), fromJson: addAdModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> addAd() async {
    final postApi =
        PostApi(uri: ApiVariables().add_ad(), fromJson: (s) {}, body: {});
    return await postApi.callRequest();
  }

  Future<List<TenderModel>> showTenders() async {
    final getApi =
        GetApi(uri: ApiVariables().getTenders(), fromJson: tenderModelFromJson);
    return await getApi.callRequest();
  }
}
