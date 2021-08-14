class DataModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  List<Currency>? bpi;

  DataModel({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    disclaimer = json['disclaimer'];
    chartName = json['chartName'];
    bpi = [];
    (json['bpi'] as Map<String, dynamic>).forEach((key, value) {
      bpi?.add(Currency.fromJson(value));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.time != null) {
      data['time'] = this.time?.toJson();
    }
    data['disclaimer'] = this.disclaimer;
    data['chartName'] = this.chartName;
    if (this.bpi != null) {
      data['bpi'] = this.bpi?.toList();
    }
    return data;
  }
}

class Time {
  String? updated;
  String? updatedISO;
  String? updateduk;

  Time({
    this.updated,
    this.updatedISO,
    this.updateduk,
  });

  Time.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    updatedISO = json['updatedISO'];
    updateduk = json['updateduk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['updatedISO'] = this.updatedISO;
    data['updateduk'] = this.updateduk;
    return data;
  }
}

class Currency {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Currency({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    rate = json['rate'];
    description = json['description'];
    rateFloat = json['rate_float'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['symbol'] = this.symbol;
    data['rate'] = this.rate;
    data['description'] = this.description;
    data['rate_float'] = this.rateFloat;
    return data;
  }
}
