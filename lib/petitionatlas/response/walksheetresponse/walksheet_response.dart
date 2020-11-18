class WalksheetResponse {
  List<CountyOptions> _countyOptions;

  List<CountyOptions> get countyOptions => _countyOptions;

  WalksheetResponse({
      List<CountyOptions> countyOptions}){
    _countyOptions = countyOptions;
}

  WalksheetResponse.fromJson(dynamic json) {
    if (json["countyOptions"] != null) {
      _countyOptions = [];
      json["countyOptions"].forEach((v) {
        _countyOptions.add(CountyOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_countyOptions != null) {
      map["countyOptions"] = _countyOptions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CountyOptions {
  String _name;
  List<CityOptions> _cityOptions;

  String get name => _name;
  List<CityOptions> get cityOptions => _cityOptions;

  CountyOptions({
      String name, 
      List<CityOptions> cityOptions}){
    _name = name;
    _cityOptions = cityOptions;
}

  CountyOptions.fromJson(dynamic json) {
    _name = json["name"];
    if (json["cityOptions"] != null) {
      _cityOptions = [];
      json["cityOptions"].forEach((v) {
        _cityOptions.add(CityOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    if (_cityOptions != null) {
      map["cityOptions"] = _cityOptions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CityOptions {
  String _name;
  List<WardOptions> _wardOptions;

  String get name => _name;
  List<WardOptions> get wardOptions => _wardOptions;

  CityOptions({
      String name, 
      List<WardOptions> wardOptions}){
    _name = name;
    _wardOptions = wardOptions;
}

  CityOptions.fromJson(dynamic json) {
    _name = json["name"];
    if (json["wardOptions"] != null) {
      _wardOptions = [];
      json["wardOptions"].forEach((v) {
        _wardOptions.add(WardOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    if (_wardOptions != null) {
      map["wardOptions"] = _wardOptions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class WardOptions {
  String _name;
  List<String> _precinctNames;

  String get name => _name;
  List<String> get precinctNames => _precinctNames;

  WardOptions({
      String name, 
      List<String> precinctNames}){
    _name = name;
    _precinctNames = precinctNames;
}

  WardOptions.fromJson(dynamic json) {
    _name = json["name"];
    _precinctNames = json["precinctNames"] != null ? json["precinctNames"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["precinctNames"] = _precinctNames;
    return map;
  }

}