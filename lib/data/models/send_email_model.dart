class SendEmailModel {
  String? serviceId;
  String? templateId;
  String? userId;
  String? accessToken;
  TemplateParams? templateParams;

  SendEmailModel(
      {this.serviceId,
      this.templateId,
      this.userId,
      this.accessToken,
      this.templateParams});

  SendEmailModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    templateId = json['template_id'];
    userId = json['user_id'];
    accessToken = json['accessToken'];
    templateParams = json['template_params'] != null
        ? TemplateParams.fromJson(json['template_params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['template_id'] = templateId;
    data['user_id'] = userId;
    data['accessToken'] = accessToken;
    if (templateParams != null) {
      data['template_params'] = templateParams!.toJson();
    }
    return data;
  }
}

class TemplateParams {
  String? toName;
  String? phone;
  String? email;
  num? creditAmount;
  num? monthlyPayment;
  String? creditType;
  String? bankName;
  String? totalRepaymentAmount;

  TemplateParams(
      {this.toName,
      this.phone,
      this.email,
      this.creditAmount,
      this.monthlyPayment,
      this.creditType,
      this.bankName,
      this.totalRepaymentAmount});

  TemplateParams.fromJson(Map<String, dynamic> json) {
    toName = json['to_name'];
    phone = json['phone'];
    email = json['email'];
    creditAmount = json['creditAmount'];
    monthlyPayment = json['monthlyPayment'];
    creditType = json['creditType'];
    bankName = json['bankName'];
    totalRepaymentAmount = json['totalRepaymentAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to_name'] = toName;
    data['phone'] = phone;
    data['email'] = email;
    data['creditAmount'] = creditAmount;
    data['monthlyPayment'] = monthlyPayment;
    data['creditType'] = creditType;
    data['bankName'] = bankName;
    data['totalRepaymentAmount'] = totalRepaymentAmount;
    return data;
  }
}
