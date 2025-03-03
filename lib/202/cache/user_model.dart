class User {
  String? name;
  String? desc;
  String? url;

  User(this.name, this.desc, this.url);

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['desc'] = desc;
    data['url'] = url;
    return data;
  }
}