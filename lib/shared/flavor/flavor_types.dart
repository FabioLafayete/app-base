import 'flavor_constants.dart';

enum FlavorType { prd, dev, local }

extension GetFlavorType on String {
  FlavorType toFlavor() {
    return {
      prdKey: FlavorType.prd,
      devKey: FlavorType.dev,
      localKey: FlavorType.local,
    }[this]!;
  }
}
