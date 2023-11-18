class BankInfoModel {
  List<Tariffs>? tariffs;

  BankInfoModel({this.tariffs});

  BankInfoModel.fromJson(Map<String, dynamic> json) {
    if (json['tariffs'] != null) {
      tariffs = <Tariffs>[];
      json['tariffs'].forEach((v) {
        tariffs!.add(Tariffs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tariffs != null) {
      data['tariffs'] = tariffs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tariffs {
  num? creditAmount;
  num? monthlyPayment;
  String? creditType;
  String? bankName;
  String? logoUrl;
  num? totalRepaymentAmount;

  Tariffs(
      {this.creditAmount,
      this.monthlyPayment,
      this.creditType,
      this.bankName,
      this.logoUrl,
      this.totalRepaymentAmount});

  Tariffs.fromJson(Map<String, dynamic> json) {
    creditAmount = json['creditAmount'];
    monthlyPayment = json['monthlyPayment'];
    creditType = json['creditType'];
    bankName = json['bankName'];
    logoUrl = json['logoUrl'];
    totalRepaymentAmount = json['totalRepaymentAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['creditAmount'] = creditAmount;
    data['monthlyPayment'] = monthlyPayment;
    data['creditType'] = creditType;
    data['bankName'] = bankName;
    data['logoUrl'] = logoUrl;
    data['totalRepaymentAmount'] = totalRepaymentAmount;
    return data;
  }
}
