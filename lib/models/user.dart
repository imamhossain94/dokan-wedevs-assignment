import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.meta,
    this.links,
  });

  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  List<String>? roles;
  DateTime? registeredDate;
  Capabilities? capabilities;
  ExtraCapabilities? extraCapabilities;
  Map<String, String>? avatarUrls;
  List<dynamic>? meta;
  Links? links;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    url: json["url"],
    description: json["description"],
    link: json["link"],
    locale: json["locale"],
    nickname: json["nickname"],
    slug: json["slug"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    registeredDate: DateTime.parse(json["registered_date"]),
    capabilities: Capabilities.fromJson(json["capabilities"]),
    extraCapabilities: ExtraCapabilities.fromJson(json["extra_capabilities"]),
    avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "url": url,
    "description": description,
    "link": link,
    "locale": locale,
    "nickname": nickname,
    "slug": slug,
    "roles": List<dynamic>.from(roles!.map((x) => x)),
    "registered_date": registeredDate!.toIso8601String(),
    "capabilities": capabilities!.toJson(),
    "extra_capabilities": extraCapabilities!.toJson(),
    "avatar_urls": Map.from(avatarUrls!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "meta": List<dynamic>.from(meta!.map((x) => x)),
    "_links": links!.toJson(),
  };
}

class Capabilities {
  Capabilities({
    this.read,
    this.level0,
    this.subscriber,
  });

  bool? read;
  bool? level0;
  bool? subscriber;

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    read: json["read"],
    level0: json["level_0"],
    subscriber: json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "read": read,
    "level_0": level0,
    "subscriber": subscriber,
  };
}

class ExtraCapabilities {
  ExtraCapabilities({
    required this.subscriber,
  });

  bool subscriber;

  factory ExtraCapabilities.fromJson(Map<String, dynamic> json) => ExtraCapabilities(
    subscriber: json["subscriber"],
  );

  Map<String, dynamic> toJson() => {
    "subscriber": subscriber,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}
