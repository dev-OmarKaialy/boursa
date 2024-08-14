import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:p_boursa/features/add_ad/data/models/add_admodel.dart';
import 'package:p_boursa/features/add_ad/data/repositories/addadrepo.dart';
import 'package:p_boursa/features/auth/presentation/bloc/auth_bloc.dart';

import '../../data/models/tender_model.dart';

part 'add_ad_event.dart';
part 'add_ad_state.dart';

class AddAdBloc extends Bloc<AddAdEvent, AddAdState> {
  AddAdBloc() : super(const AddAdState()) {
    on<GetAds>((event, emit) async {
      emit(state.copyWith(status: CubitStatus.loading));
      final result = await Addadrepo().showadd();
      result.fold((left) {
        emit(state.copyWith(status: CubitStatus.failed));
      }, (right) {
        emit(state.copyWith(status: CubitStatus.success, ads: right));
      });
    });
    on<GetTenders>((event, emit) async {
      emit(state.copyWith(tenderStatus: CubitStatus.loading));
      final result = await Addadrepo().getTenders();
      result.fold((left) {
        emit(state.copyWith(tenderStatus: CubitStatus.failed));
      }, (right) {
        emit(state.copyWith(tenderStatus: CubitStatus.success, tenders: right));
      });
    });
  }
}
