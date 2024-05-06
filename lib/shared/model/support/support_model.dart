import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

@freezed
class SupportModel with _$SupportModel {
  const SupportModel._();
  const factory SupportModel({
    required String subject,
    required String message,
    required SupportReasonEnum reason,
  }) = _SupportModel;

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      _$SupportModelFromJson(json);
}

enum SupportReasonEnum {
  PROBLEM,
  DOUBT,
  PRIASE,
  PARTNERSHIP,
  REIMBURSEMENT,
  SUBSCRIPTION_CANCELED
}