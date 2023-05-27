import 'package:hive/hive.dart';
part 'trade_brains_db.g.dart';

@HiveType(typeId: 1)
class CompanyData extends HiveObject {
  @HiveField(0)
  String? companyName;

  @HiveField(1)
  String? companySympol;

  @HiveField(2)
  String? sharePrice;

  CompanyData({this.companyName, this.companySympol, this.sharePrice});
}
