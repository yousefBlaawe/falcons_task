import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:falcons_task/core/network/sqflight.dart';
import 'package:falcons_task/core/services/tost.dart';
import 'package:falcons_task/data/models/marge_modle.dart';
import 'package:falcons_task/domain/entities/master_item.dart';
import 'package:falcons_task/domain/entities/quntity.dart';
import 'package:falcons_task/domain/usecase/master_usecase.dart';
import 'package:falcons_task/domain/usecase/quantity_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';

part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc({
    required this.itemMasterUsecase,
    required this.quantityUsecase,
    required this.databaseHelper,
  }) : super(ItemInitial()) {
    on<GetItemMasterEvent>(_onGetItem);
    on<GetItemQuantityEvent>(_onGetQuantity);
    on<FetchDataEvent>(_onFetchData);
    on<SearchItemEvent>(_onSearchItemEvent);
  }

  //=============[UseCases]=====================
  final QuantityUsecase quantityUsecase;
  final ItemMasterUsecase itemMasterUsecase;

  //==============[Data]========================
  List<Quantity> listOfQuantity = [];
  List<MasterItem> listOfItem = [];
  List<MargeModel> listOfMarge = [];
  List<Map<String, dynamic>> fetchedData = [];
  List<Map<String, dynamic>> searchItemList = [];
  Map<String,dynamic>searchItem={};
  //===============[Controller]=================
  TextEditingController searchController = TextEditingController();

  //=============[instances]====================
  final DatabaseHelper databaseHelper;

  //=====================[Get Item Master Event]====
  FutureOr<void> _onGetItem(GetItemMasterEvent event, Emitter emit) async {
    emit(ItemMasterLoadingState());
    final result = await itemMasterUsecase.call();
    result.fold((l) {
      emit(ItemMasterFailState(error: l.message));
      log("${l.message}===========================");
      showToast(text: l.message, state: ToastState.ERROR);
    }, (r) {
      // log("the rrr is $r");
      showToast(text: 'Get Items Successfully', state: ToastState.SUCCESS);
      listOfItem = r;
      log('${listOfItem.length.toString()}=========== length ');
      margeItems();
      emit(ItemMasterSuccessState());
    });
  }

//======================[Get Quantity Event]========
  FutureOr<void> _onGetQuantity(
      GetItemQuantityEvent event, Emitter emit) async {
    emit(ItemQuantityLoadingState());
    final result = await quantityUsecase.call();
    result.fold((l) {
      emit(ItemQuantityFailState(error: l.message));
      log("${l.message}===========================");
      showToast(text: l.message, state: ToastState.ERROR);
    }, (r) {
      // log("the rrr is $r");
      showToast(text: 'Get Quantity Successfully', state: ToastState.SUCCESS);
      listOfQuantity = r;
      log('${listOfQuantity.length.toString()}================ length two');
      emit(ItemQuantitySuccessState());
    });
  }

  //================[Marge Data]===================
  void margeItems() async {
    log(listOfQuantity.length.toString());
    log('${listOfItem.length.toString()}=========== length ');

    for (int i = 0; i < listOfItem.length; i++) {
      for (int j = 0; j < listOfQuantity.length; j++) {
        if (listOfQuantity[j].itemOCode == listOfItem[i].itemNo) {
          log(listOfQuantity[j].itemOCode);
          final mergedItem = MargeModel(
            stockCode: listOfQuantity[j].stockCode,
            quantity: listOfQuantity[j].quantity,
            companyNo: listOfItem[i].companyNo,
            itemNo: listOfItem[i].itemNo,
            name: listOfItem[i].name,
            categoryId: listOfItem[i].categoryId,
            itemK: listOfItem[i].itemK,
            barCode: listOfItem[i].barCode,
            minPrice: listOfItem[i].minPrice,
            itemL: listOfItem[i].itemL,
            isSuspended: listOfItem[i].isSuspended,
            FD: listOfItem[i].FD,
            itemHasSerial: listOfItem[i].itemHasSerial,
            itemPicsPath: listOfItem[i].itemPicsPath,
            taxPerc: listOfItem[i].taxPerc,
            isApipic: listOfItem[i].isApipic,
            lsPrice: listOfItem[i].lsPrice,
          );

          listOfMarge.add(mergedItem);
          break;
        }
      }
    }

    final List<Map<String, dynamic>> mergedDataMaps = listOfMarge.map((item) {
      return {
        "comapnyno": item.companyNo,
        "itemno": item.itemNo,
        "itemocode": item.stockCode,
        "name": item.name,
        "barcode": item.barCode,
        "qty": item.quantity,
        "categoryid": item.categoryId,
        "itemk": item.itemK,
        "minprice": item.minPrice,
        "iteml": item.itemL,
        "issuspended": item.isSuspended,
        "f_d": item.FD,
        "itemhasserial": item.itemHasSerial,
        "itempicspath": item.itemPicsPath,
        "taxperc": item.taxPerc,
        "isapipic": item.isApipic,
        "lsprice": item.lsPrice,
      };
    }).toList();

    try {
      await databaseHelper.insertData(mergedDataMaps);
      log('Data saved successfully to the database.');
      showToast(text: 'Data saved successfully', state: ToastState.SUCCESS);
    } catch (e) {
      log('Error saving data to the database: $e');
      showToast(
          text: 'Failed to save data to the database', state: ToastState.ERROR);
    }
  }

//================[Fetch Data]========================
  Future<void> _onFetchData(FetchDataEvent event, Emitter emit) async {
    emit(FetchDataLoadingState());
    try {
      fetchedData = await databaseHelper.fetchData();
      showToast(text: 'Fetch Data Successfully', state: ToastState.SUCCESS);
      emit(FetchDataSuccessState());
    } catch (e) {
      showToast(text: e.toString(), state: ToastState.SUCCESS);
      emit(FetchDataFailState());
    }
  }

  //================[Search Item]====================
  void _onSearchItemEvent(SearchItemEvent event, Emitter emit) {
    emit(SearchItemLoadingState());
    if (searchController.text.isEmpty) {
     searchItemList=[];
    } else {
       fetchedData.where((item) {
         searchItem=item;
        if (item['name'] == searchController.text ||
            item['itemno'] == searchController.text) {
          searchItemList.add(searchItem);
          emit(SearchItemSuccessState());
          return true;
        }
        return false;
      }).toList();
    }
    if (searchItemList.isEmpty) {
      showToast(text: 'Not found this item', state: ToastState.WARNING);
      emit(SearchItemFailState());
    }
  }
}
