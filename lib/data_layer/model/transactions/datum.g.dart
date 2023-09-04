// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      amount: json['amount'] as String?,
      status: json['status'] as String?,
      sourceId: json['sourceId'] as String?,
      sourceType: json['sourceType'] as String?,
      transactionType: json['transactionType'] as String?,
      currency: json['currency'] as String?,
      createdAt: json['createdAt'],
      fee: json['fee'] as String?,
      description: json['description'] as String?,
      settledAt: json['settledAt'] as String?,
      estimatedSettledAt: json['estimatedSettledAt'],
      currency1: json['currency1'] as String?,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'sourceId': instance.sourceId,
      'sourceType': instance.sourceType,
      'transactionType': instance.transactionType,
      'currency': instance.currency,
      'createdAt': instance.createdAt,
      'fee': instance.fee,
      'description': instance.description,
      'settledAt': instance.settledAt,
      'estimatedSettledAt': instance.estimatedSettledAt,
      'currency1': instance.currency1,
      'company': instance.company,
    };
