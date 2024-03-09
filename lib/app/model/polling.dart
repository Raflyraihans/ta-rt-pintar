class Polling {
  int? id;
  int? rukunTetanggaId;
  String? title;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<PollingOptions>? pollingOptions;

  Polling(
      {this.id,
      this.rukunTetanggaId,
      this.title,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pollingOptions});

  Polling.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rukunTetanggaId = json['rukun_tetangga_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['polling_option'] != null) {
      pollingOptions = <PollingOptions>[];
      json['polling_option'].forEach((v) {
        pollingOptions!.add(PollingOptions.fromJson(v));
      });
    }
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
    if (pollingOptions != null) {
      data['polling_options'] = pollingOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PollingOptions {
  int? id;
  int? pollingId;
  String? optionName;
  String? vote;
  String? createdAt;
  String? updatedAt;

  PollingOptions(
      {this.id,
      this.pollingId,
      this.optionName,
      this.vote,
      this.createdAt,
      this.updatedAt});

  PollingOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pollingId = json['polling_id'];
    optionName = json['option_name'];
    vote = json['vote'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['polling_id'] = pollingId;
    data['option_name'] = optionName;
    data['vote'] = vote;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
