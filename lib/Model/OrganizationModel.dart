import 'dart:convert';

class OrganizationModel {
  int id;
  String name;
  String contact;
  OrganizationModel({
    required this.id,
    required this.name,
    required this.contact,
  });

  OrganizationModel copyWith({
    int? id,
    String? name,
    String? contact,
  }) {
    return OrganizationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'contact': contact});

    return result;
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      contact: map['contact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationModel.fromJson(String source) =>
      OrganizationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrganizationModel(id: $id, name: $name, contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrganizationModel &&
        other.id == id &&
        other.name == name &&
        other.contact == contact;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ contact.hashCode;
}
