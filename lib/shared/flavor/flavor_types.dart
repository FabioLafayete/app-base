import 'flavor_constants.dart';

enum FlavorType { prd, dev }

extension GetFlavorType on String {
  FlavorType toFlavor() {
    return {
      prdKey: FlavorType.prd,
      devKey: FlavorType.dev,
    }[this]!;
  }
}
