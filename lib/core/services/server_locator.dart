import 'package:falcons_task/core/network/sqflight.dart';
import 'package:falcons_task/data/datasorce/master_datasorce.dart';
import 'package:falcons_task/data/reposiotry/master_item_repository.dart';
import 'package:falcons_task/domain/repositories/base_master_repository.dart';
import 'package:falcons_task/domain/usecase/master_usecase.dart';
import 'package:falcons_task/domain/usecase/quantity_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServerLocator {
  Future<void> inti() async {
    sl
      ..registerLazySingleton(() => QuantityUsecase(sl()))
      ..registerLazySingleton(() => ItemMasterUsecase(sl()))
      ..registerLazySingleton<BaseItemMaterRepository>(
          () => MasterItemRepository(sl()))
      ..registerLazySingleton<BaseItemMasterDataSource>(
          () => ItemMasterDataSource());
    //=======================================================
    sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  }
}
