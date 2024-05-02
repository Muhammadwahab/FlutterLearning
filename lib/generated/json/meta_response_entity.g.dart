import 'package:buscaro_flutter/generated/json/base/json_convert_content.dart';
import 'package:buscaro_flutter/models/meta_response_entity.dart';

MetaResponseEntity<T> $MetaResponseEntityFromJson<T>(Map<String, T> json) {
	final MetaResponseEntity<T> metaResponseEntity = MetaResponseEntity<T>();
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		metaResponseEntity.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		metaResponseEntity.message = message;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		metaResponseEntity.success = success;
	}
	final MetaResponseError? error = jsonConvert.convert<MetaResponseError>(json['error']);
	if (error != null) {
		metaResponseEntity.error = error;
	}
	final MetaResponseVersions? versions = jsonConvert.convert<MetaResponseVersions>(json['versions']);
	if (versions != null) {
		metaResponseEntity.versions = versions;
	}
	return metaResponseEntity;
}

// Map<String, dynamic> $MetaResponseEntityToJson(MetaResponseEntity entity) {
// 	final Map<String, dynamic> data = <String, dynamic>{};
// 	data['data'] = entity.data?.toJson();
// 	data['message'] = entity.message;
// 	data['success'] = entity.success;
// 	data['error'] = entity.error?.toJson();
// 	data['versions'] = entity.versions?.toJson();
// 	return data;
// }

MetaResponseData $MetaResponseDataFromJson(Map<String, dynamic> json) {
	final MetaResponseData metaResponseData = MetaResponseData();
	final MetaResponseDataMeta? meta = jsonConvert.convert<MetaResponseDataMeta>(json['meta']);
	if (meta != null) {
		metaResponseData.meta = meta;
	}
	return metaResponseData;
}

Map<String, dynamic> $MetaResponseDataToJson(MetaResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['meta'] = entity.meta?.toJson();
	return data;
}

MetaResponseDataMeta $MetaResponseDataMetaFromJson(Map<String, dynamic> json) {
	final MetaResponseDataMeta metaResponseDataMeta = MetaResponseDataMeta();
	final int? otpReset = jsonConvert.convert<int>(json['otp_reset']);
	if (otpReset != null) {
		metaResponseDataMeta.otpReset = otpReset;
	}
	final List<String>? ageGroup = jsonConvert.convertListNotNull<String>(json['age_group']);
	if (ageGroup != null) {
		metaResponseDataMeta.ageGroup = ageGroup;
	}
	final List<String>? bookingCancellation = jsonConvert.convertListNotNull<String>(json['booking_cancellation']);
	if (bookingCancellation != null) {
		metaResponseDataMeta.bookingCancellation = bookingCancellation;
	}
	return metaResponseDataMeta;
}

Map<String, dynamic> $MetaResponseDataMetaToJson(MetaResponseDataMeta entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['otp_reset'] = entity.otpReset;
	data['age_group'] =  entity.ageGroup;
	data['booking_cancellation'] =  entity.bookingCancellation;
	return data;
}

MetaResponseError $MetaResponseErrorFromJson(Map<String, dynamic> json) {
	final MetaResponseError metaResponseError = MetaResponseError();
	return metaResponseError;
}

Map<String, dynamic> $MetaResponseErrorToJson(MetaResponseError entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	return data;
}

MetaResponseVersions $MetaResponseVersionsFromJson(Map<String, dynamic> json) {
	final MetaResponseVersions metaResponseVersions = MetaResponseVersions();
	final String? app = jsonConvert.convert<String>(json['app']);
	if (app != null) {
		metaResponseVersions.app = app;
	}
	final MetaResponseVersionsAndroidDriver? androidDriver = jsonConvert.convert<MetaResponseVersionsAndroidDriver>(json['android_driver']);
	if (androidDriver != null) {
		metaResponseVersions.androidDriver = androidDriver;
	}
	final MetaResponseVersionsAndroidPassenger? androidPassenger = jsonConvert.convert<MetaResponseVersionsAndroidPassenger>(json['android_passenger']);
	if (androidPassenger != null) {
		metaResponseVersions.androidPassenger = androidPassenger;
	}
	return metaResponseVersions;
}

Map<String, dynamic> $MetaResponseVersionsToJson(MetaResponseVersions entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['app'] = entity.app;
	data['android_driver'] = entity.androidDriver?.toJson();
	data['android_passenger'] = entity.androidPassenger?.toJson();
	return data;
}

MetaResponseVersionsAndroidDriver $MetaResponseVersionsAndroidDriverFromJson(Map<String, dynamic> json) {
	final MetaResponseVersionsAndroidDriver metaResponseVersionsAndroidDriver = MetaResponseVersionsAndroidDriver();
	final String? build = jsonConvert.convert<String>(json['build']);
	if (build != null) {
		metaResponseVersionsAndroidDriver.build = build;
	}
	final String? update = jsonConvert.convert<String>(json['update']);
	if (update != null) {
		metaResponseVersionsAndroidDriver.update = update;
	}
	return metaResponseVersionsAndroidDriver;
}

Map<String, dynamic> $MetaResponseVersionsAndroidDriverToJson(MetaResponseVersionsAndroidDriver entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['build'] = entity.build;
	data['update'] = entity.update;
	return data;
}

MetaResponseVersionsAndroidPassenger $MetaResponseVersionsAndroidPassengerFromJson(Map<String, dynamic> json) {
	final MetaResponseVersionsAndroidPassenger metaResponseVersionsAndroidPassenger = MetaResponseVersionsAndroidPassenger();
	final String? build = jsonConvert.convert<String>(json['build']);
	if (build != null) {
		metaResponseVersionsAndroidPassenger.build = build;
	}
	final String? update = jsonConvert.convert<String>(json['update']);
	if (update != null) {
		metaResponseVersionsAndroidPassenger.update = update;
	}
	return metaResponseVersionsAndroidPassenger;
}

Map<String, dynamic> $MetaResponseVersionsAndroidPassengerToJson(MetaResponseVersionsAndroidPassenger entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['build'] = entity.build;
	data['update'] = entity.update;
	return data;
}