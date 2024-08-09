import 'package:dartz/dartz.dart';
import 'package:p_boursa/core/error/failures.dart';
import 'package:p_boursa/core/unified_api/handling_exception_manager.dart';
import 'package:p_boursa/features/add_ad/data/datasources/AddAddatasource.dart';
import 'package:p_boursa/features/add_ad/data/models/add_admodel.dart';

class Addadrepo with HandlingExceptionManager {
  Future<Either<Failure, AddAdModel>> showadd() async {
    return wrapHandling(tryCall: () async {
      return Right(await AddAddatasourece().showadd());
    });
  }
}
