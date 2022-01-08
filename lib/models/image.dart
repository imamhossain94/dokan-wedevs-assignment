
class Image {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGMT;
  DateTime? dateModified;
  DateTime? dateModifiedGMT;
  String? src;
  String? name;
  String? alt;

  Image(this.id, this.src, this.name, this.alt, this.dateCreated,
      this.dateCreatedGMT, this.dateModified, this.dateModifiedGMT);

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = (json['src'] is String ? json['src'] : json['src'].toString());
    name = json['name'];
    alt = json['alt'];
    if (json['date_created'] != null) {
      dateCreated = DateTime.parse(json['date_created']);
    }
    if (json['date_modified_gmt'] != null) {
      dateModifiedGMT = DateTime.parse(json['date_modified_gmt']);
    }
    if (json['date_modified'] != null) {
      dateModified = DateTime.parse(json['date_modified']);
    }
    if (json['date_created_gmt'] != null) {
      dateCreatedGMT = DateTime.parse(json['date_created_gmt']);
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'src': src,
    'name': name,
    'alt': alt,
    'date_created': dateCreated,
    'date_modified_gmt': dateModifiedGMT,
    'date_modified': dateModified,
    'date_created_gmt': dateCreatedGMT
  };
}