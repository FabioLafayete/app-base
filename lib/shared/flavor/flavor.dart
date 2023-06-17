import 'flavor_types.dart';

abstract class Flavors {
  void initialize(Map<FlavorType, Map<String, String>> endpoints);

  String getEndpoint(String key);

  FlavorType getCurrentFlavor();

  void setCurrentFlavor(FlavorType type);

  String getValue(String key);

  void addMapFlavorsEndpoints(Map<FlavorType, Map<String, String>> mapFlavorsEndpoints);
}
