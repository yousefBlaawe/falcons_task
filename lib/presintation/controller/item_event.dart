part of 'item_bloc.dart';

@immutable
sealed class ItemEvent {}

class GetItemMasterEvent extends ItemEvent{}
class GetItemQuantityEvent extends ItemEvent{}
class FetchDataEvent extends ItemEvent{}
class SearchItemEvent extends ItemEvent{}
