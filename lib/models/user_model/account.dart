import 'dart:convert';

class Account {
  int? id;
  String? number;
  String? agency;
  double? balance;
  double? limit;

  Account({this.id, this.number, this.agency, this.balance, this.limit});

  factory Account.fromMap(Map<String, dynamic> data) => Account(
        id: data['id'] as int?,
        number: data['number'] as String?,
        agency: data['agency'] as String?,
        balance: (data['balance'] as num?)?.toDouble(),
        limit: double.parse(data['limit'].toString()),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'number': number,
        'agency': agency,
        'balance': balance,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Account].
  factory Account.fromJson(String data) {
    return Account.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Account] to a JSON string.
  String toJson() => json.encode(toMap());
}
