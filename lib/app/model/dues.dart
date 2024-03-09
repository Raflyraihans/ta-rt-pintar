class Donation {
  int? id;
  int? rukunTetanggaId;
  String? title;
  String? description;
  String? rekeningNumber;
  String? picture;
  String? status;
  String? donationAmount;
  String? createdAt;
  String? updatedAt;

  Donation(
      {this.id,
      this.rukunTetanggaId,
      this.title,
      this.description,
      this.rekeningNumber,
      this.picture,
      this.status,
      this.donationAmount,
      this.createdAt,
      this.updatedAt});

  Donation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    title = json['title'];
    description = json['description'];
    rekeningNumber = json['rekening_number'];
    picture = json['picture'];
    status = json['status'];
    donationAmount = json['donation_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['title'] = title;
    data['description'] = description;
    data['rekening_number'] = rekeningNumber;
    data['picture'] = picture;
    data['status'] = status;
    data['donation_amount'] = donationAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
