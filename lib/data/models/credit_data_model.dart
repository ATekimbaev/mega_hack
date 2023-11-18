class CreditDataModel {
  List<String>? currencies;
  List<CreditTypes>? creditTypes;

  CreditDataModel({this.currencies, this.creditTypes});

  CreditDataModel.fromJson(Map<String, dynamic> json) {
    currencies = json['currencies'].cast<String>();
    if (json['creditTypes'] != null) {
      creditTypes = <CreditTypes>[];
      json['creditTypes'].forEach((v) {
        creditTypes!.add(CreditTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currencies'] = currencies;
    if (creditTypes != null) {
      data['creditTypes'] = creditTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreditTypes {
  int? id;
  String? typeCred;

  CreditTypes({this.id, this.typeCred});

  CreditTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeCred = json['typeCred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typeCred'] = typeCred;
    return data;
  }
}
