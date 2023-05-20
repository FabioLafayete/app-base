import '../flavor.dart';
import '../flavor_constants.dart';
import '../flavor_types.dart';


class FlavorsImpl implements Flavors {
  late Map<String, String> _endpoints;
  late FlavorType _currentFlavor;

  Map<FlavorType, Map<String, String>> mapFlavorsInject = {};

  FlavorsImpl({
    Map<FlavorType, Map<String, String>>? mapFlavorsInject,
  }) {
    this.mapFlavorsInject = mapFlavorsInject ?? this.mapFlavorsInject;
  }

  @override
  void initialize(Map<FlavorType, Map<String, String>> endpoints) {
    try {
      _currentFlavor = _getFlavor();
      _endpoints = endpoints[_currentFlavor]!;
    } catch (e) {
      _currentFlavor = FlavorType.dev;
      _endpoints = endpoints[_currentFlavor]!;
    }
  }

  @override
  String getEndpoint(String key) {
    return _endpoints[key]!;
  }

  FlavorType _getFlavor() {
    const environment = String.fromEnvironment(flavorKey);
    return environment.toFlavor();
  }

  @override
  FlavorType getCurrentFlavor() => _currentFlavor;

  @override
  void setCurrentFlavor(FlavorType type) {
    _currentFlavor = type;
  }

  @override
  String getValue(String key) {
    return _endpoints[key]!;
  }

  @override
  void addMapFlavorsEndpoints(
      Map<FlavorType, Map<String, String>> mapFlavorsEndpoints,
      ) {
    if(mapFlavorsEndpoints.isNotEmpty){
      mapFlavorsEndpoints.forEach((key, value) async {
        if(mapFlavorsInject.containsKey(key)){
          mapFlavorsInject[key]?.addAll(value);
        }else{
          mapFlavorsInject[key] = value;
        }
      });
    }
  }
}
