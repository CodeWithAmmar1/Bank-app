import 'dart:convert';

class Model {
  final String name;
  final String amount;

  Model({required this.name, required this.amount});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      name: json['name'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
    };
  }
}

List<Model> transData = [];
