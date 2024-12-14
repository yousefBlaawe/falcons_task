import 'package:dartz/dartz.dart';
import 'package:falcons_task/core/error/failuer.dart';
import 'package:falcons_task/domain/entities/quntity.dart';
import 'package:falcons_task/domain/repositories/base_master_repository.dart';

class QuantityUsecase {
  BaseItemMaterRepository baseItemMaterRepository;

  QuantityUsecase(this.baseItemMaterRepository);

  Future<Either<Failure, List<Quantity>>> call() {
    return baseItemMaterRepository.getQuantity();
  }
}
