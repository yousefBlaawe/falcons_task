import 'package:equatable/equatable.dart';

class Quantity extends Equatable {
  final String companyNo;
  final String stockCode;
  final String itemOCode;
  final String quantity;

  const Quantity(
      {required this.companyNo,
      required this.itemOCode,
      required this.quantity,
      required this.stockCode});

  @override
  List<Object?> get props => [
        companyNo,
        stockCode,
        itemOCode,
        quantity,
      ];
}
