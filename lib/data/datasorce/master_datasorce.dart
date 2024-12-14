import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:falcons_task/core/error/exceptions.dart';
import 'package:falcons_task/core/network/apis.dart';
import 'package:falcons_task/core/network/error_model.dart';
import 'package:falcons_task/core/services/dio.dart';
import 'package:falcons_task/data/models/item_master_model.dart';
import 'package:falcons_task/data/models/quantity_model.dart';

abstract class BaseItemMasterDataSource
{
  Future<List<ItemMasterModel>>getItemMaster();
  Future<List<Quantitymodel>>getQuantity();
}
class ItemMasterDataSource extends BaseItemMasterDataSource
{

  @override
  Future<List<ItemMasterModel>> getItemMaster() async {
    try {
      final res = await DioHelper.getData(
          url: MyApisUrls.itemsMaster());
      // log('get masterItem res one  ${res.statusCode}');
      // log('get masterItem res two ${res.data}');
      if (res.statusCode == 200) {
        print('eeeeeeeeeeeeeeeee');
        return List.from(
            (res.data['Items_Master'] as List).map((e) => ItemMasterModel.fromJson(e)));
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data),
        );
      }
    } on DioException catch (e) {
      log('get masterItem res three ${e.message}');
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
    } catch (e) {
      print('the dkdkdkdkdk ${e.toString()}');
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          e.toString(),
        ),
      );
    }
  }
// "SalesMan_Items_Balance"
  @override
  Future<List<Quantitymodel>> getQuantity() async {
    try {
      final res = await DioHelper.getData(
          url: MyApisUrls.quantity());
      // log('get Quantity res ${res.statusCode}');
      // log('get Quantity res  ${res.data}');
      if (res.statusCode == 200) {
        return List<Quantitymodel>.from(
            (res.data['SalesMan_Items_Balance'] as List ).map((e) => Quantitymodel.fromJson(e)));
      } else {
        throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data),
        );
      }
    } on DioException catch (e) {
      log('get Quantity res ${e.message}');

      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
    } catch (e) {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(
          e.toString(),
        ),
      );
    }
  }

}