import 'package:dartz/dartz.dart';
import 'package:falcons_task/core/error/failuer.dart';
import 'package:falcons_task/domain/entities/master_item.dart';
import 'package:falcons_task/domain/entities/quntity.dart';
abstract class BaseItemMaterRepository
{
  Future<Either<Failure,List<MasterItem>>>getItemMaster();
  Future<Either<Failure,List<Quantity>>>getQuantity();
}