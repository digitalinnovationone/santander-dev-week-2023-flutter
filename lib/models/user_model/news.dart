import 'dart:convert';

class News {
	int? id;
	String? icon;
	String? description;

	News({this.id, this.icon, this.description});

	factory News.fromMap(Map<String, dynamic> data) => News(
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
  /// Parses the string and returns the resulting Json object as [News].
	factory News.fromJson(String data) {
		return News.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [News] to a JSON string.
	String toJson() => json.encode(toMap());
}
