import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Transaction {
  String? id;
  String? amount;
  String? status;
  String? sourceId;
  String? sourceType;
  String? transactionType;
  String? currency;
  dynamic createdAt;
  String? fee;
  String? description;
  String? settledAt;
  dynamic estimatedSettledAt;
  String? currency1;
  String? company;

  Transaction({
    this.id,
    this.amount,
    this.status,
    this.sourceId,
    this.sourceType,
    this.transactionType,
    this.currency,
    this.createdAt,
    this.fee,
    this.description,
    this.settledAt,
    this.estimatedSettledAt,
    this.currency1,
    this.company,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
