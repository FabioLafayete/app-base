// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportModel _$$_SupportModelFromJson(Map<String, dynamic> json) =>
    _$_SupportModel(
      subject: json['subject'] as String,
      message: json['message'] as String,
      reason: $enumDecode(_$SupportReasonEnumEnumMap, json['reason']),
    );

Map<String, dynamic> _$$_SupportModelToJson(_$_SupportModel instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'message': instance.message,
      'reason': _$SupportReasonEnumEnumMap[instance.reason]!,
    };

const _$SupportReasonEnumEnumMap = {
  SupportReasonEnum.PROBLEM: 'PROBLEM',
  SupportReasonEnum.DOUBT: 'DOUBT',
  SupportReasonEnum.PRIASE: 'PRIASE',
  SupportReasonEnum.PARTNERSHIP: 'PARTNERSHIP',
  SupportReasonEnum.REIMBURSEMENT: 'REIMBURSEMENT',
  SupportReasonEnum.SUBSCRIPTION_CANCELED: 'SUBSCRIPTION_CANCELED',
};
