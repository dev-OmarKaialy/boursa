part of 'add_ad_bloc.dart';

abstract class AddAdEvent extends Equatable {
  const AddAdEvent();

  @override
  List<Object> get props => [];
}

class GetAds extends AddAdEvent {}

class GetTenders extends AddAdEvent {}
