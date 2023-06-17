import 'package:app/shared/constants/string_contants.dart';

import '../flavor/flavor_types.dart';

const Map<FlavorType, Map<String, String>> endpoints = {
  FlavorType.dev: {StringConstants.hostKey: StringConstants.hostDevEndpoint},
  FlavorType.prd: {StringConstants.hostKey: StringConstants.hostProdEndpoint},
  FlavorType.local: {StringConstants.hostKey: StringConstants.hostLocalEndpoint},
};
