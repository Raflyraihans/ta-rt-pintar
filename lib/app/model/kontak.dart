class Kontak {
  int? id;
  int? rukunTetanggaId;
  int? index;
  String? name;
  String? phoneNumber;
  String? position;
  String? house;
  String? address;
  String? createdAt;
  String? updatedAt;

  Kontak(
      {this.id,
      this.rukunTetanggaId,
      this.index,
      this.name,
      this.phoneNumber,
      this.position,
      this.house,
      this.address,
      this.createdAt,
      this.updatedAt});

  Kontak.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    index = json['index'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    position = json['position'];
    house = json['house'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['index'] = index;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['position'] = position;
    data['house'] = house;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
