import 'package:p_boursa/core/unified_api/api_variables.dart';
import 'package:p_boursa/core/unified_api/get_api.dart';
import 'package:p_boursa/core/unified_api/post_api.dart';
import 'package:p_boursa/features/auth/data/models/authmodel.dart';

class Authdatasource {
  Future<LoginModel> login() async {
    final getApi =
        GetApi(uri: ApiVariables().Login(), fromJson: loginModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> register() async {
    final postApi = PostApi(
        uri: ApiVariables().register(), fromJson: loginModelFromJson, body: {});
    return await postApi.callRequest();
  }
}
