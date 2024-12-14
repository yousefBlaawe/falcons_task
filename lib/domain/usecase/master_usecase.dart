import 'package:dartz/dartz.dart';
import 'package:falcons_task/domain/entities/master_item.dart';

import '../../core/error/failuer.dart';
import '../repositories/base_master_repository.dart';

class ItemMasterUsecase
{
  BaseItemMaterRepository baseItemMaterRepository;

  ItemMasterUsecase(this.baseItemMaterRepository);

  Future<Either<Failure,List<MasterItem>>>call()
  async{
    return await baseItemMaterRepository.getItemMaster();
  }
}