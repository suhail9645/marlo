// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      errorFlag: json['error_flag'] as String?,
      message: json['message'] as String?,
      hasMore: json['has_more'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'error_flag': instance.errorFlag,
      'message': instance.message,
      'has_more': instance.hasMore,
      'data': instance.data,
    };
