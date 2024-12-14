import 'package:falcons_task/domain/entities/master_item.dart';

class ItemMasterModel extends MasterItem {
  const ItemMasterModel(
      {required super.companyNo,
      required super.lsPrice,
      required super.itemNo,
      required super.name,
      required super.categoryId,
      required super.itemK,
      required super.barCode,
      required super.minPrice,
      required super.itemL,
      required super.isSuspended,
      required super.FD,
      required super.itemHasSerial,
      required super.itemPicsPath,
      required super.isApipic,
      required super.taxPerc});

  factory ItemMasterModel.fromJson(Map<String, dynamic> json) {
    return ItemMasterModel(
        companyNo: json['COMAPNYNO'],
        lsPrice: json['LSPRICE'],
        itemNo: json['ITEMNO'],
        name: json['NAME'],
        categoryId: json['CATEOGRYID'],
        itemK: json['ItemK'],
        barCode: json['BARCODE'],
        minPrice: json['MINPRICE'],
        itemL: json['ITEML'],
        isSuspended: json['ISSUSPENDED'],
        FD: json['F_D'],
        itemHasSerial: json['ITEMHASSERIAL'],
        itemPicsPath: json['ITEMPICSPATH'],
        isApipic: json['ISAPIPIC'],
        taxPerc: json['TAXPERC']);
  }
}
