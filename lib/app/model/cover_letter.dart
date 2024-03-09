import 'package:rtkita/app/model/family_member.dart';

class CoverLetter {
  int? id;
  int? rukunTetanggaId;
  int? familyMemberId;
  String? letterNumber;
  String? year;
  String? title;
  String? description;
  String? file;
  String? createdBy;
  String? status;
  String? createdAt;
  String? updatedAt;
  FamilyMember? familyMember;

  CoverLetter(
      {this.id,
      this.rukunTetanggaId,
      this.familyMemberId,
      this.letterNumber,
      this.year,
      this.title,
      this.description,
      this.file,
      this.createdBy,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.familyMember});

  CoverLetter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    familyMemberId = json['family_member_id'];
    letterNumber = json['letter_number'];
    year = json['year'];
    title = json['title'];
    description = json['description'];
    file = json['file'];
    createdBy = json['created_by'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    familyMember = json['family_member'] != null
        ? FamilyMember.fromJson(json['family_member'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['family_member_id'] = familyMemberId;
    data['letter_number'] = letterNumber;
    data['year'] = year;
    data['title'] = title;
    data['description'] = description;
    data['file'] = file;
    data['created_by'] = createdBy;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (familyMember != null) {
      data['family_member'] = familyMember!.toJson();
    }
    return data;
  }
}
