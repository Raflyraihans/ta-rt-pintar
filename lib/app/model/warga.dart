import 'package:rtkita/app/model/family_member.dart';

class Warga {
  int? id;
  int? userId;
  int? groupChatId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Warga(
      {this.id,
      this.userId,
      this.groupChatId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Warga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    groupChatId = json['group_chat_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['group_chat_id'] = groupChatId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? phoneNumber;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  FamilyMember? familyMember;

  User(
      {this.id,
      this.email,
      this.phoneNumber,
      this.fcmToken,
      this.createdAt,
      this.updatedAt,
      this.familyMember});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    familyMember = json['family_member'] != null
        ? FamilyMember.fromJson(json['family_member'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['fcm_token'] = fcmToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (familyMember != null) {
      data['family_member'] = familyMember!.toJson();
    }
    return data;
  }
}
