class Hosbital {
  Hosbital({
    String? hosname,
    String? hosadress,
    int? nurnumber,
    String? nurdes,
    String? nurprice,


  })
  {
    _hosname = hosname!;
    _hosadress = hosadress!;
    _nurdes=nurdes!;
    _nurprice=nurprice!;
    _nurnumber=nurnumber!;

  }

  Hosbital.fromJson(dynamic json) {
    _hosname = json['hosname'];
    _hosadress = json['hosadress'];
    _nurdes = json['nurdes'];
    _nurnumber = json['nurnumber'];
    _nurprice = json['nurprice'];

  }
  String ? _hosname;
  String ? _hosadress;
  int ? _nurnumber;
  String ? _nurdes;
  String ? _nurprice;

  String? get hosname => _hosname;
  String? get hosadress => _hosadress;
  int? get nurnumber => _nurnumber;
  String? get nurdes => _nurdes;
  String? get nurprice => _nurprice;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hosname'] = _hosname;
    map['hosadress'] = _hosadress;
    map['nurnumber'] = _nurnumber;
    map['nurdes'] = _nurdes;
    map['nurprice'] = _nurprice;

    return map;
  }

}