import 'dart:collection';
import 'dart:convert';

class Collection {
  List<dynamic>? primaryAssetContracts;
  Map<String, dynamic>? traits;
  Stats? stats;
  DisplayData? displayData;

  String? name;
  String? description;
  String? bannerImageUrl;
  String? imageUrl;
  String? featuredImageUrl;
  String? largeImageUrl;
  String? externalUrl;
  bool? hidden;
  bool? featured;
  String? createdDate;

  String? chatUrl;
  bool? defaultToFiat;
  String? devBuyerFeeBasisPoints;
  String? devSellerFeeBasisPoints;
  String? discordUrl;
  String? safelistRequestStatus;
  bool? isSubjectToWhitelist;
  String? mediumUsername;
  bool? onlyProxiedTransfers;
  String? openseaBuyerFeeBasisPoints;
  String? openseaSellerFeeBasisPoints;
  String? payoutAddress;
  bool? requireEmail;
  String? shortDescription;
  String? slug;
  String? telegramUrl;
  String? twitterUsername;
  String? instagramUsername;
  String? wikiUrl;
  int? ownedAssetCount;

  Collection(
      {required this.primaryAssetContracts,
      required this.traits,
      required this.stats,
      required this.bannerImageUrl,
      required this.chatUrl,
      required this.createdDate,
      required this.defaultToFiat,
      required this.description,
      required this.devBuyerFeeBasisPoints,
      required this.devSellerFeeBasisPoints,
      required this.discordUrl,
      required this.displayData,
      required this.externalUrl,
      required this.featured,
      required this.featuredImageUrl,
      required this.hidden,
      required this.safelistRequestStatus,
      required this.imageUrl,
      required this.isSubjectToWhitelist,
      required this.largeImageUrl,
      required this.mediumUsername,
      required this.name,
      required this.onlyProxiedTransfers,
      required this.openseaBuyerFeeBasisPoints,
      required this.openseaSellerFeeBasisPoints,
      required this.payoutAddress,
      required this.requireEmail,
      required this.shortDescription,
      required this.slug,
      required this.telegramUrl,
      required this.twitterUsername,
      required this.instagramUsername,
      required this.wikiUrl,
      required this.ownedAssetCount});

  Collection.fromJson(final Map<String, dynamic> value) {
    if (value['display_data'] != null) {
      displayData = DisplayData.fromJson(value['display_data']);
    }
    if (value['primary_asset_contracts'] != null) {
      primaryAssetContracts = value['primary_asset_contracts'] as List;
    }
    if (value['stats'] != null) {
      stats = Stats.fromJson(value['stats']);
    }
    if (value['traits'] != null) {
      traits = (value['traits'] as Map<String, dynamic>);
    }
    bannerImageUrl = value['banner_image_url'];
    chatUrl = value['chat_url'];
    createdDate = value['created_date'];
    defaultToFiat = value['default_to_fiat'];
    description = value['description'];
    devBuyerFeeBasisPoints = value['dev_buyer_fee_basis_points'];
    devSellerFeeBasisPoints = value['dev_seller_fee_basis_points'];
    discordUrl = value['discord_url'];
    externalUrl = value['external_url'];
    featured = value['featured'];
    featuredImageUrl = value['featured_image_url'];
    hidden = value['hidden'];
    safelistRequestStatus = value['safelist_request_status'];
    imageUrl = value['image_url'];
    isSubjectToWhitelist = value['is_subject_to_whitelist'];
    largeImageUrl = value['large_image_url'];
    mediumUsername = value['medium_username'];
    name = value['name'];
    onlyProxiedTransfers = value['only_proxied_transfers'];
    openseaBuyerFeeBasisPoints = value['opensea_buyer_fee_basis_points'];
    openseaSellerFeeBasisPoints = value['opensea_seller_fee_basis_points'];
    payoutAddress = value['payout_address'];
    requireEmail = value['require_email'];
    shortDescription = value['short_description'];
    slug = value['slug'];
    telegramUrl = value['telegram_url'];
    twitterUsername = value['twitter_username'];
    instagramUsername = value['instagram_username'];
    wikiUrl = value['wiki_url'];
    ownedAssetCount = value['owned_asset_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = HashMap<String, dynamic>();
    data['primary_asset_contracts'] = json.encode(primaryAssetContracts);
    data['traits'] = json.encode(traits);
    data['stats'] = json.encode(stats);
    data['banner_image_url'] = bannerImageUrl;
    data['chat_url'] = chatUrl;
    data['created_date'] = createdDate;
    data['default_to_fiat'] = defaultToFiat;
    data['description'] = description;
    data['dev_buyer_fee_basis_points'] = devBuyerFeeBasisPoints;
    data['dev_seller_fee_basis_points'] = devSellerFeeBasisPoints;
    data['discord_url'] = discordUrl;
    data['display_data'] = json.encode(displayData);
    data['external_url'] = externalUrl;
    data['featured'] = featured;
    data['featured_image_url'] = featuredImageUrl;
    data['hidden'] = hidden;
    data['safelist_request_status'] = safelistRequestStatus;
    data['image_url'] = imageUrl;
    data['is_subject_to_whitelist'] = isSubjectToWhitelist;
    data['large_image_url'] = largeImageUrl;
    data['medium_username'] = mediumUsername;
    data['name'] = name;
    data['only_proxied_transfers'] = onlyProxiedTransfers;
    data['opensea_buyer_fee_basis_points'] = openseaBuyerFeeBasisPoints;
    data['opensea_seller_fee_basis_points'] = openseaSellerFeeBasisPoints;
    data['payout_address'] = payoutAddress;
    data['require_email'] = requireEmail;
    data['short_description'] = shortDescription;
    data['slug'] = slug;
    data['telegram_url'] = telegramUrl;
    data['twitter_username'] = twitterUsername;
    data['instagram_username'] = instagramUsername;
    data['wiki_url'] = wikiUrl;
    data['owned_asset_count'] = ownedAssetCount;
    return data;
  }
}

class Stats {
  double? oneDayVolume;
  double? oneDayChange;
  double? oneDaySales;
  double? oneDayAveragePrice;
  double? sevenDayVolume;
  double? sevenDayChange;
  double? sevenDaySales;
  double? sevenDayAveragePrice;
  double? thirtyDayVolume;
  double? thirtyDayChange;
  double? thirtyDaySales;
  double? thirtyDayAveragePrice;
  double? totalVolume;
  double? totalSales;
  double? totalSupply;
  double? count;
  int? numOwners;
  double? averagePrice;
  int? numReports;
  double? marketCap;
  double? floorPrice;

  Stats(
      {required this.oneDayVolume,
      required this.oneDayChange,
      required this.oneDaySales,
      required this.oneDayAveragePrice,
      required this.sevenDayVolume,
      required this.sevenDayChange,
      required this.sevenDaySales,
      required this.sevenDayAveragePrice,
      required this.thirtyDayVolume,
      required this.thirtyDayChange,
      required this.thirtyDaySales,
      required this.thirtyDayAveragePrice,
      required this.totalVolume,
      required this.totalSales,
      required this.totalSupply,
      required this.count,
      required this.numOwners,
      required this.averagePrice,
      required this.numReports,
      required this.marketCap,
      required this.floorPrice});

  Stats.fromJson(final Map<String, dynamic> json) {
    oneDayVolume = json['one_day_volume'];
    oneDayChange = json['one_day_change'];
    oneDaySales = json['one_day_sales'];
    oneDayAveragePrice = json['one_day_average_price'];
    sevenDayVolume = json['seven_day_volume'];
    sevenDayChange = json['seven_day_change'];
    sevenDaySales = json['seven_day_sales'];
    sevenDayAveragePrice = json['seven_day_average_price'];
    thirtyDayVolume = json['thirty_day_volume'];
    thirtyDayChange = json['thirty_day_change'];
    thirtyDaySales = json['thirty_day_sales'];
    thirtyDayAveragePrice = json['thirty_day_average_price'];
    totalVolume = json['total_volume'];
    totalSales = json['total_sales'];
    totalSupply = json['total_supply'];
    count = json['count'];
    numOwners = json['num_owners'];
    averagePrice = json['average_price'];
    numReports = json['num_reports'];
    marketCap = json['market_cap'];
    floorPrice = json['floor_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = HashMap<String, dynamic>();
    data['one_day_volume'] = oneDayVolume;
    data['one_day_change'] = oneDayChange;
    data['one_day_sales'] = oneDaySales;
    data['one_day_average_price'] = oneDayAveragePrice;
    data['seven_day_volume'] = sevenDayVolume;
    data['seven_day_change'] = sevenDayChange;
    data['seven_day_sales'] = sevenDaySales;
    data['seven_day_average_price'] = sevenDayAveragePrice;
    data['thirty_day_volume'] = thirtyDayVolume;
    data['thirty_day_change'] = thirtyDayChange;
    data['thirty_day_sales'] = thirtyDaySales;
    data['thirty_day_average_price'] = thirtyDayAveragePrice;
    data['total_volume'] = totalVolume;
    data['total_sales'] = totalSales;
    data['total_supply'] = totalSupply;
    data['count'] = count;
    data['num_owners'] = numOwners;
    data['average_price'] = averagePrice;
    data['num_reports'] = numReports;
    data['market_cap'] = marketCap;
    data['floor_price'] = floorPrice;
    return data;
  }
}

class DisplayData {
  // enum: padded, contained, covered
  late String cardDisplayStyle;

  DisplayData({required this.cardDisplayStyle});

  DisplayData.fromJson(final Map<String, dynamic> json) {
    cardDisplayStyle = json['card_display_style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = HashMap<String, dynamic>();
    data['card_display_style'] = cardDisplayStyle;
    return data;
  }
}
