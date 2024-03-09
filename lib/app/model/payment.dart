import 'package:rtkita/app/model/family_member.dart';

class Payment {
  int? id;
  int? rukunTetanggaId;
  int? donationId;
  String? donationAmount;
  String? picture;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic familyMember;
  dynamic donation;

  Payment(
      {this.id,
      this.rukunTetanggaId,
      this.donationId,
      this.picture,
      this.status,
      this.donationAmount,
      this.createdAt,
      this.updatedAt, this.familyMember, this.donation});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['family_member_id'];
    donationId = json['donation_id'];
    donationAmount = json['nominal'];
    picture = json['file'];
    status = json['status'];
    familyMember = json['family_member'];
    donation = json['donation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['family_member_id'] = rukunTetanggaId;
    data['donation_id'] = donationId;
    data['file'] = picture;
    data['status'] = status;
    data['nominal'] = donationAmount;
    data['family_member'] = familyMember;
    data['donation'] = donation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
