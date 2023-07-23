import 'dart:convert';

class Feature {
	int? id;
	String? icon;
	String? description;

	Feature({this.id, this.icon, this.description});

	factory Feature.fromMap(Map<String, dynamic> data) => Feature(
				id: data['id'] as int?,
				icon: data['icon'] as String?,
				description: data['description'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'icon': icon,
				'description': description,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Feature].
	factory Feature.fromJson(String data) {
		return Feature.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Feature] to a JSON string.
	String toJson() => json.encode(toMap());
}
