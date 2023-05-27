// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_brains_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyDataAdapter extends TypeAdapter<CompanyData> {
  @override
  final int typeId = 1;

  @override
  CompanyData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyData(
      companyName: fields[0] as String?,
      companySympol: fields[1] as String?,
      sharePrice: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.companySympol)
      ..writeByte(2)
      ..write(obj.sharePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
