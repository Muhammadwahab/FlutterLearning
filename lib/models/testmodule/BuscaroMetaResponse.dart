import 'dart:convert';
/// data : {"meta":{"otp_reset":30,"age_group":["<20","21 - 30","31 - 40","41 - 50","50+"],"booking_cancellation":["I want to change my ride details.","My ride was late.","I could not find the station.","I was unable to contact the Captain.","I found an alternative.","Other reasons."],"account_deletion":["I’ve got a better service","Not anymore interested","Got some personal issues","Other reasons"],"refer_amount":"100","zendesk":{"zendesk_url":"https://buscarohelp.zendesk.com","application_id":"5f2f16d50bebc1367f317501494f49af8dc5f717b736cf7e","client_id":"mobile_sdk_client_7f2b655efc3184a1021d"},"adblock":{"image":"https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png","url":"https://www.hackerrank.com/"},"zendesk_android":"eyJzZXR0aW5nc191cmwiOiJodHRwczovL2J1c2Nhcm9oZWxwLnplbmRlc2suY29tL21vYmlsZV9zZGtfYXBpL3NldHRpbmdzLzAxR1BYQlk3UVY0WVM3N0hKNFk5UlNKVjJSLmpzb24ifQ","google_map_key":"AIzaSyD-FKsz-pb0q0FzikWY5Adc8QpWzAh7ZNA","eventree_token":"BRokNMJCbY0CjaYr3vjQnEkqqJYeTUIp","eventree_url":"http://13.229.247.21/","webengage_secret":"~47b65b99","adjust_referral":"https://app.adjust.com/1gtmiqy?campaign=","adjust_key":"247785dk15nk","webengage_key":"webengage_key","ride_tracking_url":"https://admin-dev.buscaro.com/shift-tracking/","pre_ride_tracking_url":"https://admin-dev.buscaro.com/pre-ride-tracking/","referral_deeplink":"referral_screen","bank_details":{"account_title":"BUSCARO TECHNOLOGIES (Pvt) LTD","account_number":"PK30BAHL1288098100857601","bank_name":"Bank Al Habib","branch":"Khayaban e Shahbaz Branch, Karachi","whatsapp_contact_link":"https://wa.me/+923163638900"},"directions_key":"AIzaSyCq1nFxKQiUAKu-BdBIw_Gjs3RZbmymyMc","bounds":{"south_west":{"latitude":"24.7466037","longitude":null},"north_east":{"latitude":"25.6398011","longitude":"67.65694169999999"}},"max_resend_count":"1","otp_expire_time":"120","firebase_disability":"0"}}
/// message : "Operation successful"
/// success : true
/// error : {}
/// versions : {"app":"0.1.0","android_driver":{"build":"30","update":"1"},"android_passenger":{"build":"19","update":"2"}}

// BuscaroMetaResponse buscaroMetaResponseFromJson(String str) => BuscaroMetaResponse.fromJson(json.decode(str),T);
// String buscaroMetaResponseToJson(BuscaroMetaResponse data) => json.encode(data.toJson());
class BuscaroMetaResponse<T> {
  BuscaroMetaResponse({
      T? data,
      String? message, 
      bool? success, 
      dynamic error, 
      Versions? versions,}){
    _data = data;
    _message = message;
    _success = success;
    _error = error;
    _versions = versions;
}

  BuscaroMetaResponse.fromJson(Map<String, dynamic> json,T Function(dynamic) fromJsonT) {
   // _data = json['data'] != null ? Data.fromJson(json['data']) : null;
   _data = fromJsonT(json['data']);
    _message = json['message'];
    _success = json['success'];
    _error = json['error'];
    _versions = json['versions'] != null ? Versions.fromJson(json['versions']) : null;
  }
  T? _data;
  String? _message;
  bool? _success;
  dynamic _error;
  Versions? _versions;
BuscaroMetaResponse copyWith({  Data? data,
  String? message,
  bool? success,
  dynamic error,
  Versions? versions,
}) => BuscaroMetaResponse(  data: data ?? _data,
  message: message ?? _message,
  success: success ?? _success,
  error: error ?? _error,
  versions: versions ?? _versions,
);
  T? get data => _data;
  String? get message => _message;
  bool? get success => _success;
  dynamic get error => _error;
  Versions? get versions => _versions;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (_data != null) {
  //     map['data'] = _data?.toJson();
  //   }
  //   map['message'] = _message;
  //   map['success'] = _success;
  //   map['error'] = _error;
  //   if (_versions != null) {
  //     map['versions'] = _versions?.toJson();
  //   }
  //   return map;
  // }

}

/// app : "0.1.0"
/// android_driver : {"build":"30","update":"1"}
/// android_passenger : {"build":"19","update":"2"}

Versions versionsFromJson(String str) => Versions.fromJson(json.decode(str));
String versionsToJson(Versions data) => json.encode(data.toJson());
class Versions {
  Versions({
      String? app, 
      AndroidDriver? androidDriver, 
      AndroidPassenger? androidPassenger,}){
    _app = app;
    _androidDriver = androidDriver;
    _androidPassenger = androidPassenger;
}

  Versions.fromJson(dynamic json) {
    _app = json['app'];
    _androidDriver = json['android_driver'] != null ? AndroidDriver.fromJson(json['android_driver']) : null;
    _androidPassenger = json['android_passenger'] != null ? AndroidPassenger.fromJson(json['android_passenger']) : null;
  }
  String? _app;
  AndroidDriver? _androidDriver;
  AndroidPassenger? _androidPassenger;
Versions copyWith({  String? app,
  AndroidDriver? androidDriver,
  AndroidPassenger? androidPassenger,
}) => Versions(  app: app ?? _app,
  androidDriver: androidDriver ?? _androidDriver,
  androidPassenger: androidPassenger ?? _androidPassenger,
);
  String? get app => _app;
  AndroidDriver? get androidDriver => _androidDriver;
  AndroidPassenger? get androidPassenger => _androidPassenger;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app'] = _app;
    if (_androidDriver != null) {
      map['android_driver'] = _androidDriver?.toJson();
    }
    if (_androidPassenger != null) {
      map['android_passenger'] = _androidPassenger?.toJson();
    }
    return map;
  }

}

/// build : "19"
/// update : "2"

AndroidPassenger androidPassengerFromJson(String str) => AndroidPassenger.fromJson(json.decode(str));
String androidPassengerToJson(AndroidPassenger data) => json.encode(data.toJson());
class AndroidPassenger {
  AndroidPassenger({
      String? build, 
      String? update,}){
    _build = build;
    _update = update;
}

  AndroidPassenger.fromJson(dynamic json) {
    _build = json['build'];
    _update = json['update'];
  }
  String? _build;
  String? _update;
AndroidPassenger copyWith({  String? build,
  String? update,
}) => AndroidPassenger(  build: build ?? _build,
  update: update ?? _update,
);
  String? get build => _build;
  String? get update => _update;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['build'] = _build;
    map['update'] = _update;
    return map;
  }

}

/// build : "30"
/// update : "1"

AndroidDriver androidDriverFromJson(String str) => AndroidDriver.fromJson(json.decode(str));
String androidDriverToJson(AndroidDriver data) => json.encode(data.toJson());
class AndroidDriver {
  AndroidDriver({
      String? build, 
      String? update,}){
    _build = build;
    _update = update;
}

  AndroidDriver.fromJson(dynamic json) {
    _build = json['build'];
    _update = json['update'];
  }
  String? _build;
  String? _update;
AndroidDriver copyWith({  String? build,
  String? update,
}) => AndroidDriver(  build: build ?? _build,
  update: update ?? _update,
);
  String? get build => _build;
  String? get update => _update;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['build'] = _build;
    map['update'] = _update;
    return map;
  }

}

/// meta : {"otp_reset":30,"age_group":["<20","21 - 30","31 - 40","41 - 50","50+"],"booking_cancellation":["I want to change my ride details.","My ride was late.","I could not find the station.","I was unable to contact the Captain.","I found an alternative.","Other reasons."],"account_deletion":["I’ve got a better service","Not anymore interested","Got some personal issues","Other reasons"],"refer_amount":"100","zendesk":{"zendesk_url":"https://buscarohelp.zendesk.com","application_id":"5f2f16d50bebc1367f317501494f49af8dc5f717b736cf7e","client_id":"mobile_sdk_client_7f2b655efc3184a1021d"},"adblock":{"image":"https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png","url":"https://www.hackerrank.com/"},"zendesk_android":"eyJzZXR0aW5nc191cmwiOiJodHRwczovL2J1c2Nhcm9oZWxwLnplbmRlc2suY29tL21vYmlsZV9zZGtfYXBpL3NldHRpbmdzLzAxR1BYQlk3UVY0WVM3N0hKNFk5UlNKVjJSLmpzb24ifQ","google_map_key":"AIzaSyD-FKsz-pb0q0FzikWY5Adc8QpWzAh7ZNA","eventree_token":"BRokNMJCbY0CjaYr3vjQnEkqqJYeTUIp","eventree_url":"http://13.229.247.21/","webengage_secret":"~47b65b99","adjust_referral":"https://app.adjust.com/1gtmiqy?campaign=","adjust_key":"247785dk15nk","webengage_key":"webengage_key","ride_tracking_url":"https://admin-dev.buscaro.com/shift-tracking/","pre_ride_tracking_url":"https://admin-dev.buscaro.com/pre-ride-tracking/","referral_deeplink":"referral_screen","bank_details":{"account_title":"BUSCARO TECHNOLOGIES (Pvt) LTD","account_number":"PK30BAHL1288098100857601","bank_name":"Bank Al Habib","branch":"Khayaban e Shahbaz Branch, Karachi","whatsapp_contact_link":"https://wa.me/+923163638900"},"directions_key":"AIzaSyCq1nFxKQiUAKu-BdBIw_Gjs3RZbmymyMc","bounds":{"south_west":{"latitude":"24.7466037","longitude":null},"north_east":{"latitude":"25.6398011","longitude":"67.65694169999999"}},"max_resend_count":"1","otp_expire_time":"120","firebase_disability":"0"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Meta? meta,}){
    _meta = meta;
}

  Data.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  Meta? _meta;
Data copyWith({  Meta? meta,
}) => Data(  meta: meta ?? _meta,
);
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// otp_reset : 30
/// age_group : ["<20","21 - 30","31 - 40","41 - 50","50+"]
/// booking_cancellation : ["I want to change my ride details.","My ride was late.","I could not find the station.","I was unable to contact the Captain.","I found an alternative.","Other reasons."]
/// account_deletion : ["I’ve got a better service","Not anymore interested","Got some personal issues","Other reasons"]
/// refer_amount : "100"
/// zendesk : {"zendesk_url":"https://buscarohelp.zendesk.com","application_id":"5f2f16d50bebc1367f317501494f49af8dc5f717b736cf7e","client_id":"mobile_sdk_client_7f2b655efc3184a1021d"}
/// adblock : {"image":"https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png","url":"https://www.hackerrank.com/"}
/// zendesk_android : "eyJzZXR0aW5nc191cmwiOiJodHRwczovL2J1c2Nhcm9oZWxwLnplbmRlc2suY29tL21vYmlsZV9zZGtfYXBpL3NldHRpbmdzLzAxR1BYQlk3UVY0WVM3N0hKNFk5UlNKVjJSLmpzb24ifQ"
/// google_map_key : "AIzaSyD-FKsz-pb0q0FzikWY5Adc8QpWzAh7ZNA"
/// eventree_token : "BRokNMJCbY0CjaYr3vjQnEkqqJYeTUIp"
/// eventree_url : "http://13.229.247.21/"
/// webengage_secret : "~47b65b99"
/// adjust_referral : "https://app.adjust.com/1gtmiqy?campaign="
/// adjust_key : "247785dk15nk"
/// webengage_key : "webengage_key"
/// ride_tracking_url : "https://admin-dev.buscaro.com/shift-tracking/"
/// pre_ride_tracking_url : "https://admin-dev.buscaro.com/pre-ride-tracking/"
/// referral_deeplink : "referral_screen"
/// bank_details : {"account_title":"BUSCARO TECHNOLOGIES (Pvt) LTD","account_number":"PK30BAHL1288098100857601","bank_name":"Bank Al Habib","branch":"Khayaban e Shahbaz Branch, Karachi","whatsapp_contact_link":"https://wa.me/+923163638900"}
/// directions_key : "AIzaSyCq1nFxKQiUAKu-BdBIw_Gjs3RZbmymyMc"
/// bounds : {"south_west":{"latitude":"24.7466037","longitude":null},"north_east":{"latitude":"25.6398011","longitude":"67.65694169999999"}}
/// max_resend_count : "1"
/// otp_expire_time : "120"
/// firebase_disability : "0"

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      int? otpReset,
      List<String>? ageGroup, 
      List<String>? bookingCancellation, 
      List<String>? accountDeletion, 
      String? referAmount, 
      Zendesk? zendesk, 
      Adblock? adblock, 
      String? zendeskAndroid, 
      String? googleMapKey, 
      String? eventreeToken, 
      String? eventreeUrl, 
      String? webengageSecret, 
      String? adjustReferral, 
      String? adjustKey, 
      String? webengageKey, 
      String? rideTrackingUrl, 
      String? preRideTrackingUrl, 
      String? referralDeeplink, 
      BankDetails? bankDetails, 
      String? directionsKey, 
      Bounds? bounds, 
      String? maxResendCount, 
      String? otpExpireTime, 
      String? firebaseDisability,}){
    _otpReset = otpReset;
    _ageGroup = ageGroup;
    _bookingCancellation = bookingCancellation;
    _accountDeletion = accountDeletion;
    _referAmount = referAmount;
    _zendesk = zendesk;
    _adblock = adblock;
    _zendeskAndroid = zendeskAndroid;
    _googleMapKey = googleMapKey;
    _eventreeToken = eventreeToken;
    _eventreeUrl = eventreeUrl;
    _webengageSecret = webengageSecret;
    _adjustReferral = adjustReferral;
    _adjustKey = adjustKey;
    _webengageKey = webengageKey;
    _rideTrackingUrl = rideTrackingUrl;
    _preRideTrackingUrl = preRideTrackingUrl;
    _referralDeeplink = referralDeeplink;
    _bankDetails = bankDetails;
    _directionsKey = directionsKey;
    _bounds = bounds;
    _maxResendCount = maxResendCount;
    _otpExpireTime = otpExpireTime;
    _firebaseDisability = firebaseDisability;
}

  Meta.fromJson(dynamic json) {
    _otpReset = json['otp_reset'];
    _ageGroup = json['age_group'] != null ? json['age_group'].cast<String>() : [];
    _bookingCancellation = json['booking_cancellation'] != null ? json['booking_cancellation'].cast<String>() : [];
    _accountDeletion = json['account_deletion'] != null ? json['account_deletion'].cast<String>() : [];
    _referAmount = json['refer_amount'];
    _zendesk = json['zendesk'] != null ? Zendesk.fromJson(json['zendesk']) : null;
    _adblock = json['adblock'] != null ? Adblock.fromJson(json['adblock']) : null;
    _zendeskAndroid = json['zendesk_android'];
    _googleMapKey = json['google_map_key'];
    _eventreeToken = json['eventree_token'];
    _eventreeUrl = json['eventree_url'];
    _webengageSecret = json['webengage_secret'];
    _adjustReferral = json['adjust_referral'];
    _adjustKey = json['adjust_key'];
    _webengageKey = json['webengage_key'];
    _rideTrackingUrl = json['ride_tracking_url'];
    _preRideTrackingUrl = json['pre_ride_tracking_url'];
    _referralDeeplink = json['referral_deeplink'];
    _bankDetails = json['bank_details'] != null ? BankDetails.fromJson(json['bank_details']) : null;
    _directionsKey = json['directions_key'];
    _bounds = json['bounds'] != null ? Bounds.fromJson(json['bounds']) : null;
    _maxResendCount = json['max_resend_count'];
    _otpExpireTime = json['otp_expire_time'];
    _firebaseDisability = json['firebase_disability'];
  }
  int? _otpReset;
  List<String>? _ageGroup;
  List<String>? _bookingCancellation;
  List<String>? _accountDeletion;
  String? _referAmount;
  Zendesk? _zendesk;
  Adblock? _adblock;
  String? _zendeskAndroid;
  String? _googleMapKey;
  String? _eventreeToken;
  String? _eventreeUrl;
  String? _webengageSecret;
  String? _adjustReferral;
  String? _adjustKey;
  String? _webengageKey;
  String? _rideTrackingUrl;
  String? _preRideTrackingUrl;
  String? _referralDeeplink;
  BankDetails? _bankDetails;
  String? _directionsKey;
  Bounds? _bounds;
  String? _maxResendCount;
  String? _otpExpireTime;
  String? _firebaseDisability;
Meta copyWith({  int? otpReset,
  List<String>? ageGroup,
  List<String>? bookingCancellation,
  List<String>? accountDeletion,
  String? referAmount,
  Zendesk? zendesk,
  Adblock? adblock,
  String? zendeskAndroid,
  String? googleMapKey,
  String? eventreeToken,
  String? eventreeUrl,
  String? webengageSecret,
  String? adjustReferral,
  String? adjustKey,
  String? webengageKey,
  String? rideTrackingUrl,
  String? preRideTrackingUrl,
  String? referralDeeplink,
  BankDetails? bankDetails,
  String? directionsKey,
  Bounds? bounds,
  String? maxResendCount,
  String? otpExpireTime,
  String? firebaseDisability,
}) => Meta(  otpReset: otpReset ?? _otpReset,
  ageGroup: ageGroup ?? _ageGroup,
  bookingCancellation: bookingCancellation ?? _bookingCancellation,
  accountDeletion: accountDeletion ?? _accountDeletion,
  referAmount: referAmount ?? _referAmount,
  zendesk: zendesk ?? _zendesk,
  adblock: adblock ?? _adblock,
  zendeskAndroid: zendeskAndroid ?? _zendeskAndroid,
  googleMapKey: googleMapKey ?? _googleMapKey,
  eventreeToken: eventreeToken ?? _eventreeToken,
  eventreeUrl: eventreeUrl ?? _eventreeUrl,
  webengageSecret: webengageSecret ?? _webengageSecret,
  adjustReferral: adjustReferral ?? _adjustReferral,
  adjustKey: adjustKey ?? _adjustKey,
  webengageKey: webengageKey ?? _webengageKey,
  rideTrackingUrl: rideTrackingUrl ?? _rideTrackingUrl,
  preRideTrackingUrl: preRideTrackingUrl ?? _preRideTrackingUrl,
  referralDeeplink: referralDeeplink ?? _referralDeeplink,
  bankDetails: bankDetails ?? _bankDetails,
  directionsKey: directionsKey ?? _directionsKey,
  bounds: bounds ?? _bounds,
  maxResendCount: maxResendCount ?? _maxResendCount,
  otpExpireTime: otpExpireTime ?? _otpExpireTime,
  firebaseDisability: firebaseDisability ?? _firebaseDisability,
);
  num? get otpReset => _otpReset;
  List<String>? get ageGroup => _ageGroup;
  List<String>? get bookingCancellation => _bookingCancellation;
  List<String>? get accountDeletion => _accountDeletion;
  String? get referAmount => _referAmount;
  Zendesk? get zendesk => _zendesk;
  Adblock? get adblock => _adblock;
  String? get zendeskAndroid => _zendeskAndroid;
  String? get googleMapKey => _googleMapKey;
  String? get eventreeToken => _eventreeToken;
  String? get eventreeUrl => _eventreeUrl;
  String? get webengageSecret => _webengageSecret;
  String? get adjustReferral => _adjustReferral;
  String? get adjustKey => _adjustKey;
  String? get webengageKey => _webengageKey;
  String? get rideTrackingUrl => _rideTrackingUrl;
  String? get preRideTrackingUrl => _preRideTrackingUrl;
  String? get referralDeeplink => _referralDeeplink;
  BankDetails? get bankDetails => _bankDetails;
  String? get directionsKey => _directionsKey;
  Bounds? get bounds => _bounds;
  String? get maxResendCount => _maxResendCount;
  String? get otpExpireTime => _otpExpireTime;
  String? get firebaseDisability => _firebaseDisability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp_reset'] = _otpReset;
    map['age_group'] = _ageGroup;
    map['booking_cancellation'] = _bookingCancellation;
    map['account_deletion'] = _accountDeletion;
    map['refer_amount'] = _referAmount;
    if (_zendesk != null) {
      map['zendesk'] = _zendesk?.toJson();
    }
    if (_adblock != null) {
      map['adblock'] = _adblock?.toJson();
    }
    map['zendesk_android'] = _zendeskAndroid;
    map['google_map_key'] = _googleMapKey;
    map['eventree_token'] = _eventreeToken;
    map['eventree_url'] = _eventreeUrl;
    map['webengage_secret'] = _webengageSecret;
    map['adjust_referral'] = _adjustReferral;
    map['adjust_key'] = _adjustKey;
    map['webengage_key'] = _webengageKey;
    map['ride_tracking_url'] = _rideTrackingUrl;
    map['pre_ride_tracking_url'] = _preRideTrackingUrl;
    map['referral_deeplink'] = _referralDeeplink;
    if (_bankDetails != null) {
      map['bank_details'] = _bankDetails?.toJson();
    }
    map['directions_key'] = _directionsKey;
    if (_bounds != null) {
      map['bounds'] = _bounds?.toJson();
    }
    map['max_resend_count'] = _maxResendCount;
    map['otp_expire_time'] = _otpExpireTime;
    map['firebase_disability'] = _firebaseDisability;
    return map;
  }

}

/// south_west : {"latitude":"24.7466037","longitude":null}
/// north_east : {"latitude":"25.6398011","longitude":"67.65694169999999"}

Bounds boundsFromJson(String str) => Bounds.fromJson(json.decode(str));
String boundsToJson(Bounds data) => json.encode(data.toJson());
class Bounds {
  Bounds({
      SouthWest? southWest, 
      NorthEast? northEast,}){
    _southWest = southWest;
    _northEast = northEast;
}

  Bounds.fromJson(dynamic json) {
    _southWest = json['south_west'] != null ? SouthWest.fromJson(json['south_west']) : null;
    _northEast = json['north_east'] != null ? NorthEast.fromJson(json['north_east']) : null;
  }
  SouthWest? _southWest;
  NorthEast? _northEast;
Bounds copyWith({  SouthWest? southWest,
  NorthEast? northEast,
}) => Bounds(  southWest: southWest ?? _southWest,
  northEast: northEast ?? _northEast,
);
  SouthWest? get southWest => _southWest;
  NorthEast? get northEast => _northEast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_southWest != null) {
      map['south_west'] = _southWest?.toJson();
    }
    if (_northEast != null) {
      map['north_east'] = _northEast?.toJson();
    }
    return map;
  }

}

/// latitude : "25.6398011"
/// longitude : "67.65694169999999"

NorthEast northEastFromJson(String str) => NorthEast.fromJson(json.decode(str));
String northEastToJson(NorthEast data) => json.encode(data.toJson());
class NorthEast {
  NorthEast({
      String? latitude, 
      String? longitude,}){
    _latitude = latitude;
    _longitude = longitude;
}

  NorthEast.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _latitude;
  String? _longitude;
NorthEast copyWith({  String? latitude,
  String? longitude,
}) => NorthEast(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}

/// latitude : "24.7466037"
/// longitude : null

SouthWest southWestFromJson(String str) => SouthWest.fromJson(json.decode(str));
String southWestToJson(SouthWest data) => json.encode(data.toJson());
class SouthWest {
  SouthWest({
      String? latitude, 
      dynamic longitude,}){
    _latitude = latitude;
    _longitude = longitude;
}

  SouthWest.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _latitude;
  dynamic _longitude;
SouthWest copyWith({  String? latitude,
  dynamic longitude,
}) => SouthWest(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  String? get latitude => _latitude;
  dynamic get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}

/// account_title : "BUSCARO TECHNOLOGIES (Pvt) LTD"
/// account_number : "PK30BAHL1288098100857601"
/// bank_name : "Bank Al Habib"
/// branch : "Khayaban e Shahbaz Branch, Karachi"
/// whatsapp_contact_link : "https://wa.me/+923163638900"

BankDetails bankDetailsFromJson(String str) => BankDetails.fromJson(json.decode(str));
String bankDetailsToJson(BankDetails data) => json.encode(data.toJson());
class BankDetails {
  BankDetails({
      String? accountTitle, 
      String? accountNumber, 
      String? bankName, 
      String? branch, 
      String? whatsappContactLink,}){
    _accountTitle = accountTitle;
    _accountNumber = accountNumber;
    _bankName = bankName;
    _branch = branch;
    _whatsappContactLink = whatsappContactLink;
}

  BankDetails.fromJson(dynamic json) {
    _accountTitle = json['account_title'];
    _accountNumber = json['account_number'];
    _bankName = json['bank_name'];
    _branch = json['branch'];
    _whatsappContactLink = json['whatsapp_contact_link'];
  }
  String? _accountTitle;
  String? _accountNumber;
  String? _bankName;
  String? _branch;
  String? _whatsappContactLink;
BankDetails copyWith({  String? accountTitle,
  String? accountNumber,
  String? bankName,
  String? branch,
  String? whatsappContactLink,
}) => BankDetails(  accountTitle: accountTitle ?? _accountTitle,
  accountNumber: accountNumber ?? _accountNumber,
  bankName: bankName ?? _bankName,
  branch: branch ?? _branch,
  whatsappContactLink: whatsappContactLink ?? _whatsappContactLink,
);
  String? get accountTitle => _accountTitle;
  String? get accountNumber => _accountNumber;
  String? get bankName => _bankName;
  String? get branch => _branch;
  String? get whatsappContactLink => _whatsappContactLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_title'] = _accountTitle;
    map['account_number'] = _accountNumber;
    map['bank_name'] = _bankName;
    map['branch'] = _branch;
    map['whatsapp_contact_link'] = _whatsappContactLink;
    return map;
  }

}

/// image : "https://upload.wikimedia.org/wikipedia/commons/4/40/HackerRank_Icon-1000px.png"
/// url : "https://www.hackerrank.com/"

Adblock adblockFromJson(String str) => Adblock.fromJson(json.decode(str));
String adblockToJson(Adblock data) => json.encode(data.toJson());
class Adblock {
  Adblock({
      String? image, 
      String? url,}){
    _image = image;
    _url = url;
}

  Adblock.fromJson(dynamic json) {
    _image = json['image'];
    _url = json['url'];
  }
  String? _image;
  String? _url;
Adblock copyWith({  String? image,
  String? url,
}) => Adblock(  image: image ?? _image,
  url: url ?? _url,
);
  String? get image => _image;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['url'] = _url;
    return map;
  }

}

/// zendesk_url : "https://buscarohelp.zendesk.com"
/// application_id : "5f2f16d50bebc1367f317501494f49af8dc5f717b736cf7e"
/// client_id : "mobile_sdk_client_7f2b655efc3184a1021d"

Zendesk zendeskFromJson(String str) => Zendesk.fromJson(json.decode(str));
String zendeskToJson(Zendesk data) => json.encode(data.toJson());
class Zendesk {
  Zendesk({
      String? zendeskUrl, 
      String? applicationId, 
      String? clientId,}){
    _zendeskUrl = zendeskUrl;
    _applicationId = applicationId;
    _clientId = clientId;
}

  Zendesk.fromJson(dynamic json) {
    _zendeskUrl = json['zendesk_url'];
    _applicationId = json['application_id'];
    _clientId = json['client_id'];
  }
  String? _zendeskUrl;
  String? _applicationId;
  String? _clientId;
Zendesk copyWith({  String? zendeskUrl,
  String? applicationId,
  String? clientId,
}) => Zendesk(  zendeskUrl: zendeskUrl ?? _zendeskUrl,
  applicationId: applicationId ?? _applicationId,
  clientId: clientId ?? _clientId,
);
  String? get zendeskUrl => _zendeskUrl;
  String? get applicationId => _applicationId;
  String? get clientId => _clientId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zendesk_url'] = _zendeskUrl;
    map['application_id'] = _applicationId;
    map['client_id'] = _clientId;
    return map;
  }

}