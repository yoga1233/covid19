import 'package:equatable/equatable.dart';

class ProvModel extends Equatable {
  final int positif;
  final int sembuh;
  final int dirawat;
  final int meninggal;
  final String provinsi;

  const ProvModel(
      {this.dirawat = 0,
      this.meninggal = 0,
      this.positif = 0,
      this.sembuh = 0,
      this.provinsi = ''});

  factory ProvModel.fromJson(json) => ProvModel(
        dirawat: json['dirawat'],
        meninggal: json['meninggal'],
        positif: json['kasus'],
        sembuh: json['sembuh'],
        provinsi: json['provinsi'],
      );
  @override
  List<Object?> get props => [dirawat, meninggal, positif, sembuh, provinsi];
}
