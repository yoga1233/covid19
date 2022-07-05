class IndoModel {
  int? positif;
  int? dirawat;
  int? sembuh;
  int? meninggal;
  String? lastUpdate;

  IndoModel(
      {this.positif,
      this.dirawat,
      this.sembuh,
      this.meninggal,
      this.lastUpdate});

  /// Map data dari json ke model
  IndoModel.fromJson(Map<String, dynamic> json) {
    positif = json['positif'];
    dirawat = json['dirawat'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['positif'] = positif;
    data['dirawat'] = dirawat;
    data['sembuh'] = sembuh;
    data['meninggal'] = meninggal;
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}
