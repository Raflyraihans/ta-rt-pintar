class Complaint {
  int? id;
  int? rukunTetanggaId;
  int? userId;
  String? title;
  String? description;
  String? status;
  String? note;
  String? familyMemberName;
  String? createdAt;
  String? updatedAt;
  List<ComplaintDocuments>? complaintDocuments;

  Complaint(
      {this.id,
      this.rukunTetanggaId,
      this.userId,
      this.title,
      this.description,
      this.status,
      this.note,
      this.familyMemberName,
      this.createdAt,
      this.updatedAt,
      this.complaintDocuments});

  Complaint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    note = json['note'];
    familyMemberName = json['family_member_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['complaint_document'] != null) {
      complaintDocuments = <ComplaintDocuments>[];
      json['complaint_document'].forEach((v) {
        complaintDocuments!.add(ComplaintDocuments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['note'] = note;
    data['family_member_name'] = familyMemberName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (complaintDocuments != null) {
      data['complaint_document'] =
          complaintDocuments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComplaintDocuments {
  int? id;
  int? complaintId;
  String? document;
  String? createdAt;
  String? updatedAt;

  ComplaintDocuments(
      {this.id,
      this.complaintId,
      this.document,
      this.createdAt,
      this.updatedAt});

  ComplaintDocuments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complaintId = json['complaint_id'];
    document = json['document'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['complaint_id'] = complaintId;
    data['document'] = document;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
