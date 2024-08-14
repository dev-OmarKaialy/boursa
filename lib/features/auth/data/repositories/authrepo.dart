import 'package:dartz/dartz.dart';
import 'package:p_boursa/core/error/failures.dart';
import 'package:p_boursa/core/unified_api/handling_exception_manager.dart';
import 'package:p_boursa/features/auth/data/datasources/authdatasource.dart';
import 'package:p_boursa/features/auth/data/models/authmodel.dart';

class Authrepo with HandlingExceptionManager {
  Future<Either<Failure, AuthModel>> login(body) async {
    return wrapHandling(tryCall: () async {
      return Right(await Authdatasource().login(body));
    });
  }

  Future<Either<Failure, void>> register(body) async {
    return wrapHandling(tryCall: () async {
      return Right(await Authdatasource().register(body));
    });
  }
}
