// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:buscaro_flutter/models/meta_response_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(MetaResponseEntity).toString(): MetaResponseEntity.fromJson,
		(MetaResponseData).toString(): MetaResponseData.fromJson,
		(MetaResponseDataMeta).toString(): MetaResponseDataMeta.fromJson,
		(MetaResponseError).toString(): MetaResponseError.fromJson,
		(MetaResponseVersions).toString(): MetaResponseVersions.fromJson,
		(MetaResponseVersionsAndroidDriver).toString(): MetaResponseVersionsAndroidDriver.fromJson,
		(MetaResponseVersionsAndroidPassenger).toString(): MetaResponseVersionsAndroidPassenger.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if(value == null){
      return null;
    }
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<MetaResponseEntity>[] is M){
			return data.map<MetaResponseEntity>((Map<String, dynamic> e) => MetaResponseEntity.fromJson(e)).toList() as M;
		}
		if(<MetaResponseData>[] is M){
			return data.map<MetaResponseData>((Map<String, dynamic> e) => MetaResponseData.fromJson(e)).toList() as M;
		}
		if(<MetaResponseDataMeta>[] is M){
			return data.map<MetaResponseDataMeta>((Map<String, dynamic> e) => MetaResponseDataMeta.fromJson(e)).toList() as M;
		}
		if(<MetaResponseError>[] is M){
			return data.map<MetaResponseError>((Map<String, dynamic> e) => MetaResponseError.fromJson(e)).toList() as M;
		}
		if(<MetaResponseVersions>[] is M){
			return data.map<MetaResponseVersions>((Map<String, dynamic> e) => MetaResponseVersions.fromJson(e)).toList() as M;
		}
		if(<MetaResponseVersionsAndroidDriver>[] is M){
			return data.map<MetaResponseVersionsAndroidDriver>((Map<String, dynamic> e) => MetaResponseVersionsAndroidDriver.fromJson(e)).toList() as M;
		}
		if(<MetaResponseVersionsAndroidPassenger>[] is M){
			return data.map<MetaResponseVersionsAndroidPassenger>((Map<String, dynamic> e) => MetaResponseVersionsAndroidPassenger.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}