import 'package:dartz/dartz.dart';
import 'package:p_boursa/core/error/failures.dart';
import 'package:p_boursa/core/unified_api/handling_exception_manager.dart';
import 'package:p_boursa/features/offers/data/datasources/offersdatasource.dart';
import 'package:p_boursa/features/offers/data/models/offersmodel.dart';

class Offersrepo with HandlingExceptionManager {
  Future<Either<Failure, OffersModel>> show_all_offer() async {
    return wrapHandling(tryCall: () async {
      return Right(await Offersdatasource().show_all_offer());
    });
  }
}
