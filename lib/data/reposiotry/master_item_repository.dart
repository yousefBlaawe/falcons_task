import 'package:dartz/dartz.dart';
import 'package:falcons_task/core/error/exceptions.dart';
import 'package:falcons_task/core/error/failuer.dart';
import 'package:falcons_task/data/datasorce/master_datasorce.dart';
import 'package:falcons_task/domain/entities/master_item.dart';
import 'package:falcons_task/domain/entities/quntity.dart';
import 'package:falcons_task/domain/repositories/base_master_repository.dart';

class MasterItemRepository extends BaseItemMaterRepository {
  BaseItemMasterDataSource baseItemMasterDataSource;

  MasterItemRepository(this.baseItemMasterDataSource);

  @override
  Future<Either<Failure, List<MasterItem>>> getItemMaster() async {
    try {
      final response = await baseItemMasterDataSource.getItemMaster();
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Quantity>>> getQuantity() async {
    try {
      final response = await baseItemMasterDataSource.getQuantity();
      return Right(response);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.message));
    }
  }
}
