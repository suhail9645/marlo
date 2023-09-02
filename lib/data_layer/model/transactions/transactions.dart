import 'package:json_annotation/json_annotation.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';


part 'transactions.g.dart';

@JsonSerializable()
class Transactions {
  @JsonKey(name: 'error_flag')
  String? errorFlag;
  String? message;
  @JsonKey(name: 'has_more')
  bool? hasMore;
  List<Transaction>? data;

  Transactions({this.errorFlag, this.message, this.hasMore, this.data});

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return _$TransactionsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}
