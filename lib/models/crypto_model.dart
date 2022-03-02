class CryptoModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCap;
  double? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high_24h;
  double? low_24h;
  double? priceChange_24h;
  double? priceChangePercentage_24h;
  double? marketCapChange_24h;
  double? marketCapChangePercentage_24h;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? athChangePercentage;
  String? athDate;
  double? atl;
  double? atlChangePercentage;
  String? atlDate;
  Rio? rio;
  String? lastUpdated;
  String? error;

  CryptoModel({this.id, this.symbol, this.name, this.image, this.currentPrice, this.marketCap, this.marketCapRank, this.fullyDilutedValuation, this.totalVolume, this.high_24h, this.low_24h, this.priceChange_24h, this.priceChangePercentage_24h, this.marketCapChange_24h, this.marketCapChangePercentage_24h, this.circulatingSupply, this.totalSupply, this.maxSupply, this.ath, this.athChangePercentage, this.athDate, this.atl, this.atlChangePercentage, this.atlDate, this.rio, this.lastUpdated});

  CryptoModel.withError(String errorMessage) {
    error = errorMessage;
  }
  CryptoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    image = json['image'];
    currentPrice = json['current_price'];
    marketCap = json['market_cap'];
    marketCapRank = json['market_cap_rank'];
    fullyDilutedValuation = json['fully_diluted_valuation'];
    totalVolume = json['total_volume'];
    high_24h = json['high_24h'];
    low_24h = json['low_24h'];
    priceChange_24h = json['price_change_24h'];
    priceChangePercentage_24h = json['price_change_percentage_24h'];
    marketCapChange_24h = json['market_cap_change_24h'];
    marketCapChangePercentage_24h = json['market_cap_change_percentage_24h'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    maxSupply = json['max_supply'];
    ath = json['ath'];
    athChangePercentage = json['ath_change_percentage'];
    athDate = json['ath_date'];
    atl = json['atl'];
    atlChangePercentage = json['atl_change_percentage'];
    atlDate = json['atl_date'];
    rio = json['rio'] != null ? Rio.fromJson(json['Rio']): null;
    lastUpdated =json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_rank'] = marketCapRank;
    data['fully_diluted_valuation'] = fullyDilutedValuation;
    data['total_volume'] = totalVolume;
    data['high_24h'] = high_24h;
    data['low_24h'] = low_24h;
    data['price_change_24h'] = priceChange_24h;
    data['price_change_percentage_24h'] = priceChangePercentage_24h;
    data['market_cap_change_24h'] = marketCapChange_24h;
    data['market_cap_change_percentage_24h'] = marketCapChangePercentage_24h;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['ath'] = ath;
    data['ath_change_percentage'] = athChangePercentage;
    data['ath_date'] = athDate;
    data['atl'] = atl;
    data['atl_change_percentage'] = atlChangePercentage;
    data['atl_date'] = atlDate;
    if (rio != null) {
      data['rio'] = rio!.toJson();
    }
    data['last_updated'] = lastUpdated;
    return data;
  }
}


class Rio {
  int? times;
  String? currency;
  int? percentage;

  Rio({this.times, this.currency, this.percentage});


  Rio.fromJson(Map<String, dynamic> json) {
    times =json['rio'];
    currency = json['currency'];
    percentage = json[percentage];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['times'] = times;
    data['currency'] = currency;
    data['percentage'] = percentage;
    return data;
  }

}
