class FamilyCard {
  int? id;
  int? houseId;
  String? familyCardNumber;
  String? status;
  String? createdAt;
  String? updatedAt;
  House? house;

  FamilyCard(
      {this.id,
      this.houseId,
      this.familyCardNumber,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.house});

  FamilyCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseId = json['house_id'];
    familyCardNumber = json['family_card_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    house = json['house'] != null ? House.fromJson(json['house']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['house_id'] = houseId;
    data['family_card_number'] = familyCardNumber;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (house != null) {
      data['house'] = house!.toJson();
    }
    return data;
  }
}

class House {
  int? id;
  int? rukunTetanggaId;
  String? houseBlock;
  String? houseNumber;
  String? invoiceIpl;
  double? lat;
  double? lng;
  String? createdAt;
  String? updatedAt;
  RukunTetangga? rukunTetangga;

  House(
      {this.id,
      this.rukunTetanggaId,
      this.houseBlock,
      this.houseNumber,
      this.invoiceIpl,
      this.lat,
      this.lng,
      this.createdAt,
      this.updatedAt,
      this.rukunTetangga});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    houseBlock = json['house_block'];
    houseNumber = json['house_number'];
    invoiceIpl = json['invoice_ipl'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rukunTetangga = json['rukun_tetangga'] != null
        ? RukunTetangga.fromJson(json['rukun_tetangga'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['house_block'] = houseBlock;
    data['house_number'] = houseNumber;
    data['invoice_ipl'] = invoiceIpl;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (rukunTetangga != null) {
      data['rukun_tetangga'] = rukunTetangga!.toJson();
    }
    return data;
  }
}

class RukunTetangga {
  int? id;
  String? rukunTetanggaNumber;
  String? createdAt;
  String? updatedAt;

  RukunTetangga(
      {this.id, this.rukunTetanggaNumber, this.createdAt, this.updatedAt});

  RukunTetangga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaNumber = json['rukun_tetangga_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_number'] = rukunTetanggaNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
