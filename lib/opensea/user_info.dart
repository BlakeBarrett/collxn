import 'package:collxn/opensea/account.dart';

// https://api.opensea.io/api/v1/user/${wallet_id}
class UserInfo {
  UserInfo({
    required this.username,
    required this.account,
    required this.userProfile,
  });
  late final String username;
  late final Account account;
  late final UserProfile userProfile;

  UserInfo.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    account = Account.fromJson(json['account']);
    userProfile = UserProfile.fromJson(json['user_profile']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['account'] = account.toJson();
    _data['user_profile'] = userProfile.toJson();
    return _data;
  }
}

class User {
  User({
    required this.username,
  });
  late final String username;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    return _data;
  }
}

class Currencies {
  Currencies();

  Currencies.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class UserProfile {
  UserProfile({
    required this.emailVerified,
    required this.marketingEmails,
    required this.receiveItemSoldEmails,
    required this.receiveOwnedAssetUpdateEmails,
    required this.receiveBidReceivedEmails,
    required this.bidReceivedEmailsPriceThreshold,
    required this.receiveBidItemPriceChangeEmails,
    required this.receiveOutbidEmails,
    required this.receiveReferralEmails,
    required this.receiveAuctionCreationEmails,
    required this.receiveAuctionExpirationEmails,
    required this.receiveBidInvalidEmails,
    required this.receiveBundleInvalidEmails,
    required this.receivePurchaseEmails,
    required this.receiveCancellationEmails,
    required this.receiveNewAssetReceivedEmails,
    required this.receiveNewsletter,
    required this.receiveStorefrontWhitelistedEmails,
    required this.hasAffirmativelyAcceptedOpenseaTerms,
    required this.nsfwPreference,
  });
  late final bool emailVerified;
  late final bool marketingEmails;
  late final bool receiveItemSoldEmails;
  late final bool receiveOwnedAssetUpdateEmails;
  late final bool receiveBidReceivedEmails;
  late final String bidReceivedEmailsPriceThreshold;
  late final bool receiveBidItemPriceChangeEmails;
  late final bool receiveOutbidEmails;
  late final bool receiveReferralEmails;
  late final bool receiveAuctionCreationEmails;
  late final bool receiveAuctionExpirationEmails;
  late final bool receiveBidInvalidEmails;
  late final bool receiveBundleInvalidEmails;
  late final bool receivePurchaseEmails;
  late final bool receiveCancellationEmails;
  late final bool receiveNewAssetReceivedEmails;
  late final bool receiveNewsletter;
  late final bool receiveStorefrontWhitelistedEmails;
  late final bool hasAffirmativelyAcceptedOpenseaTerms;
  late final String nsfwPreference;

  UserProfile.fromJson(Map<String, dynamic> json) {
    emailVerified = json['email_verified'];
    marketingEmails = json['marketing_emails'];
    receiveItemSoldEmails = json['receive_item_sold_emails'];
    receiveOwnedAssetUpdateEmails = json['receive_owned_asset_update_emails'];
    receiveBidReceivedEmails = json['receive_bid_received_emails'];
    bidReceivedEmailsPriceThreshold =
        json['bid_received_emails_price_threshold'];
    receiveBidItemPriceChangeEmails =
        json['receive_bid_item_price_change_emails'];
    receiveOutbidEmails = json['receive_outbid_emails'];
    receiveReferralEmails = json['receive_referral_emails'];
    receiveAuctionCreationEmails = json['receive_auction_creation_emails'];
    receiveAuctionExpirationEmails = json['receive_auction_expiration_emails'];
    receiveBidInvalidEmails = json['receive_bid_invalid_emails'];
    receiveBundleInvalidEmails = json['receive_bundle_invalid_emails'];
    receivePurchaseEmails = json['receive_purchase_emails'];
    receiveCancellationEmails = json['receive_cancellation_emails'];
    receiveNewAssetReceivedEmails = json['receive_new_asset_received_emails'];
    receiveNewsletter = json['receive_newsletter'];
    receiveStorefrontWhitelistedEmails =
        json['receive_storefront_whitelisted_emails'];
    hasAffirmativelyAcceptedOpenseaTerms =
        json['has_affirmatively_accepted_opensea_terms'];
    nsfwPreference = json['nsfw_preference'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email_verified'] = emailVerified;
    _data['marketing_emails'] = marketingEmails;
    _data['receive_item_sold_emails'] = receiveItemSoldEmails;
    _data['receive_owned_asset_update_emails'] = receiveOwnedAssetUpdateEmails;
    _data['receive_bid_received_emails'] = receiveBidReceivedEmails;
    _data['bid_received_emails_price_threshold'] =
        bidReceivedEmailsPriceThreshold;
    _data['receive_bid_item_price_change_emails'] =
        receiveBidItemPriceChangeEmails;
    _data['receive_outbid_emails'] = receiveOutbidEmails;
    _data['receive_referral_emails'] = receiveReferralEmails;
    _data['receive_auction_creation_emails'] = receiveAuctionCreationEmails;
    _data['receive_auction_expiration_emails'] = receiveAuctionExpirationEmails;
    _data['receive_bid_invalid_emails'] = receiveBidInvalidEmails;
    _data['receive_bundle_invalid_emails'] = receiveBundleInvalidEmails;
    _data['receive_purchase_emails'] = receivePurchaseEmails;
    _data['receive_cancellation_emails'] = receiveCancellationEmails;
    _data['receive_new_asset_received_emails'] = receiveNewAssetReceivedEmails;
    _data['receive_newsletter'] = receiveNewsletter;
    _data['receive_storefront_whitelisted_emails'] =
        receiveStorefrontWhitelistedEmails;
    _data['has_affirmatively_accepted_opensea_terms'] =
        hasAffirmativelyAcceptedOpenseaTerms;
    _data['nsfw_preference'] = nsfwPreference;
    return _data;
  }
}
