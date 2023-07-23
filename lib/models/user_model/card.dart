import 'dart:convert';

class CreditCard {
  int? id;
  String? number;
  double? limit;

  CreditCard({this.id, this.number, this.limit});

  factory CreditCard.fromMap(Map<String, dynamic> data) => CreditCard(
        id: data['id'] as int?,
        number: data['number'] as String?,
        limit: double.parse(data['limit'].toString()),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreditCard].
  factory CreditCard.fromJson(String data) {
    return CreditCard.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreditCard] to a JSON string.
  String toJson() => json.encode(toMap());
}
