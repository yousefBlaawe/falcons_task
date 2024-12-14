import 'package:equatable/equatable.dart';

class MasterItem extends Equatable {
  final String companyNo;
  final String itemNo;
  final String name;
  final String categoryId;
  final String itemK;
  final String barCode;
  final String minPrice;
  final String itemL;
  final String isSuspended;
  final String FD;
  final String itemHasSerial;
  final String itemPicsPath;
  final String taxPerc;
  final String isApipic;
  final String lsPrice;

  const MasterItem(
      {required this.companyNo, required this.lsPrice,
      required this.itemNo,
      required this.name,
      required this.categoryId,
      required this.itemK,
      required this.barCode,
      required this.minPrice,
      required this.itemL,
      required this.isSuspended,
      required this.FD,
      required this.itemHasSerial,
      required this.itemPicsPath,
      required this.isApipic,
      required this.taxPerc,
  });

  @override
  List<Object?> get props => [
    companyNo,
    itemPicsPath,
    itemHasSerial,
    itemK,
    itemL,
    itemNo,
    name,
    taxPerc,
    isApipic,
    isSuspended,
    FD,
    minPrice,
    barCode,
    categoryId
  ];
}

