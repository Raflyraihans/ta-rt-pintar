class FamilyMember {
  int? id;
  int? userId;
  int? familyCardId;
  String? familyMemberName;
  String? nik;
  String? gender;
  String? birthPlace;
  String? birthDate;
  String? job;
  String? religion;
  String? education;
  String? familyMemberStatus;
  String? citizenship;
  String? maritalStatus;
  String? address;
  String? avatar;
  int? verified;
  String? status;
  int? administrator;
  String? createdAt;
  String? updatedAt;

  FamilyMember(
      {this.id,
      this.userId,
      this.familyCardId,
      this.familyMemberName,
      this.nik,
      this.gender,
      this.birthPlace,
      this.birthDate,
      this.job,
      this.religion,
      this.education,
      this.familyMemberStatus,
      this.citizenship,
      this.maritalStatus,
      this.address,
      this.avatar,
      this.verified,
      this.status,
      this.administrator,
      this.createdAt,
      this.updatedAt});

  FamilyMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = int.parse(json['nik']);
    familyCardId = json['family_card_id'] ?? '';
    familyMemberName = json['family_member_name'] ?? '';
    nik = json['nik'] ?? '';
    gender = json['gender'] ?? '';
    birthPlace = json['birth_place'] ?? '';
    birthDate = json['birth_date'] ?? '';
    job = json['job'] ?? '';
    religion = json['religion'] ?? '';
    education = json['education'] ?? '';
    familyMemberStatus = json['family_member_status'] ?? '';
    citizenship = json['citizenship'] ?? '';
    maritalStatus = json['marital_status'] ?? '';
    address = json['address'] ?? '';
    avatar = json['avatar'] ?? '';
    verified = json['verified'] ?? '';
    status = json['status'] ?? '';
    // administrator = json['administrator'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['family_card_id'] = familyCardId;
    data['family_member_name'] = familyMemberName;
    data['nik'] = nik;
    data['gender'] = gender;
    data['birth_place'] = birthPlace;
    data['birth_date'] = birthDate;
    data['job'] = job;
    data['religion'] = religion;
    data['education'] = education;
    data['family_member_status'] = familyMemberStatus;
    data['citizenship'] = citizenship;
    data['marital_status'] = maritalStatus;
    data['address'] = address;
    data['avatar'] = avatar;
    data['verified'] = verified;
    data['status'] = status;
    data['administrator'] = administrator;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
