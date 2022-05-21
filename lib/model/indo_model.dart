import 'package:equatable/equatable.dart';

class IndoModel extends Equatable {
  final int positif;
  final int sembuh;
  final int dirawat;
  final int meninggal;
  final String lastUpdate;

  const IndoModel(
      {this.dirawat = 0,
      this.meninggal = 0,
      this.positif = 0,
      this.sembuh = 0,
      this.lastUpdate = ''});

  @override
  List<Object?> get props => [dirawat, meninggal, positif, sembuh, lastUpdate];
}
