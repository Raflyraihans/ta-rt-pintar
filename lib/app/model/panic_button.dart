class PanicButton {
  int? id;
  int? rukunTetanggaId;
  int? userId;
  String? username;
  String? phoneNumber;
  String? houseNumber;
  double? lat;
  double? lng;
  String? status;
  String? createdAt;
  String? updatedAt;

  PanicButton(
      {this.id,
      this.rukunTetanggaId,
      this.userId,
      this.username,
      this.phoneNumber,
      this.houseNumber,
      this.lat,
      this.lng,
      this.status,
      this.createdAt,
      this.updatedAt});

  PanicButton.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    userId = json['user_id'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    houseNumber = json['house_number'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['user_id'] = userId;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['house_number'] = houseNumber;
    data['lat'] = lat;
    data['lng'] = lng;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
