class SendCalcDataModel {
  num? creditAmount;
  num? creditTerm;
  String? creditType;

  SendCalcDataModel({this.creditAmount, this.creditTerm, this.creditType});

  SendCalcDataModel.fromJson(Map<String, dynamic> json) {
    creditAmount = json['creditAmount'];
    creditTerm = json['creditTerm'];
    creditType = json['creditType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['creditAmount'] = creditAmount;
    data['creditTerm'] = creditTerm;
    data['creditType'] = creditType;
    return data;
  }
}
