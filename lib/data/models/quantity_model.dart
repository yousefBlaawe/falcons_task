import 'package:falcons_task/domain/entities/quntity.dart';

class Quantitymodel extends Quantity {
  const Quantitymodel(
      {required super.companyNo,
      required super.itemOCode,
      required super.quantity,
      required super.stockCode});
  factory Quantitymodel.fromJson(Map<String,dynamic>json)
  {
    return Quantitymodel(
        companyNo: json['COMAPNYNO'],
        itemOCode: json['ItemOCode'],
        quantity: json['QTY'],
        stockCode: json['STOCK_CODE']);
  }

}


// "COMAPNYNO": "290",
// "STOCK_CODE": "1",
// "ItemOCode": "1011029",
// "QTY": "312"
