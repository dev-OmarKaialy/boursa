import 'package:p_boursa/core/unified_api/api_variables.dart';
import 'package:p_boursa/core/unified_api/get_api.dart';
import 'package:p_boursa/core/unified_api/post_api.dart';
import 'package:p_boursa/features/auth/data/models/authmodel.dart';

class Authdatasource {
  Future<AuthModel> login(body) async {
    final getApi = GetApi(
        uri: ApiVariables().login(), fromJson: authModelFromJson, body: body);
    return await getApi.callRequest();
  }

  Future<void> register(body) async {
    final postApi =
        PostApi(uri: ApiVariables().register(), fromJson: (s) {}, body: body);
    return await postApi.callRequest();
  }
}
