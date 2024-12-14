part of 'item_bloc.dart';

@immutable
sealed class ItemState {}

final class ItemInitial extends ItemState {}

class ItemMasterFailState extends ItemState{
  final String error;
  ItemMasterFailState({required this.error});
}
class ItemMasterSuccessState extends ItemState{}
class ItemMasterLoadingState extends ItemState{}

class ItemQuantityFailState extends ItemState{
  final String error;
  ItemQuantityFailState({required this.error});
}
class ItemQuantitySuccessState extends ItemState{}
class ItemQuantityLoadingState extends ItemState{}

class FetchDataSuccessState extends ItemState{}
class FetchDataFailState extends ItemState{}
class FetchDataLoadingState extends ItemState{}

class SearchItemLoadingState  extends ItemState{}
class SearchItemSuccessState  extends ItemState{}
class SearchItemFailState extends ItemState{}
