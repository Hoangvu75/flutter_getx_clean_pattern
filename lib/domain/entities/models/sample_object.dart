class SampleObject {
  int? id;
  String? name;
  String? description;

  SampleObject({this.id, this.name, this.description});

  SampleObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'SampleObject{id: $id, name: $name, description: $description}';
  }
}
