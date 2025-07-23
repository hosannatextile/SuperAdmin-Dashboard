
class Ticket {
  Media? media;
  String? sId;
  String? type;
  String? description;
  String? priority;
  String? deadline;
  String? status;
  String? createdAt;
  String? savedAt;

  Ticket(
      {this.media,
      this.sId,
      this.type,
      this.description,
      this.priority,
      this.deadline,
      this.status,
      this.createdAt,
      this.savedAt});

  Ticket.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    sId = json['_id'];
    type = json['type'];
    description = json['description'];
    priority = json['priority'];
    deadline = json['deadline'];
    status = json['status'];
    createdAt = json['createdAt'];
    savedAt = json['saved_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['priority'] = this.priority;
    data['deadline'] = this.deadline;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['saved_at'] = this.savedAt;
    return data;
  }
}

class Media {
  String? voiceNoteUrl;
  String? videoUrl;
  String? imageUrl;

  Media({this.voiceNoteUrl, this.videoUrl, this.imageUrl});

  Media.fromJson(Map<String, dynamic> json) {
    voiceNoteUrl = json['voice_note_url'];
    videoUrl = json['video_url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voice_note_url'] = this.voiceNoteUrl;
    data['video_url'] = this.videoUrl;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
