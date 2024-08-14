part of 'add_ad_bloc.dart';

class AddAdState {
  final CubitStatus status;
  final CubitStatus tenderStatus;
  final List<AddAdModel> ads;
  final List<TenderModel> tenders;
  const AddAdState({
    this.status = CubitStatus.init,
    this.tenderStatus = CubitStatus.init,
    this.ads = const [],
    this.tenders = const [],
  });

  AddAdState copyWith({
    CubitStatus? status,
    CubitStatus? tenderStatus,
    List<AddAdModel>? ads,
    List<TenderModel>? tenders,
  }) {
    return AddAdState(
      status: status ?? this.status,
      tenderStatus: tenderStatus ?? this.tenderStatus,
      ads: ads ?? this.ads,
      tenders: tenders ?? this.tenders,
    );
  }
}
