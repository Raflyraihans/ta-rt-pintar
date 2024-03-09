class Announcement {
  int? id;
  int? rukunTetanggaId;
  String? title;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Announcement(
      {this.id,
      this.rukunTetanggaId,
      this.title,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rukun_tetangga_id'] = rukunTetanggaId;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
