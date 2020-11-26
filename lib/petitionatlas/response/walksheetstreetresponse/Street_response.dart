class StreetResponse {
  int _id;
  String _registrationId;
  String _fullName;
  String _fullAddress;
  String _cityStateZip;
  Support _support;

  int get id => _id;
  String get registrationId => _registrationId;
  String get fullName => _fullName;
  String get fullAddress => _fullAddress;
  String get cityStateZip => _cityStateZip;
  Support get support => _support;

  StreetResponse(String key, value, {
      int id, 
      String registrationId, 
      String fullName, 
      String fullAddress, 
      String cityStateZip, 
      Support support}){
    _id = id;
    _registrationId = registrationId;
    _fullName = fullName;
    _fullAddress = fullAddress;
    _cityStateZip = cityStateZip;
    _support = support;
}

  StreetResponse.fromJson(dynamic json) {
    _id = json["id"];
    _registrationId = json["registrationId"];
    _fullName = json["fullName"];
    _fullAddress = json["fullAddress"];
    _cityStateZip = json["cityStateZip"];
    _support = json["support"] != null ? Support.fromJson(json["support"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["registrationId"] = _registrationId;
    map["fullName"] = _fullName;
    map["fullAddress"] = _fullAddress;
    map["cityStateZip"] = _cityStateZip;
    if (_support != null) {
      map["support"] = _support.toJson();
    }
    return map;
  }

}

class Support {
  int _signatureStatus;
  int _voterSupportLevel;
  String _notes;
  String _email;
  String _phone;
  String _signature;
  bool _hasIssueEducation;
  bool _hasIssuePolicing;
  bool _hasIssueHousing;
  bool _hasIssueHealthcare;
  bool _hasIssueBusiness;
  bool _hasIssueEnvironment;
  bool _hasIssueGunViolence;
  bool _hasIssueEthics;
  bool _hasEnglishAsSecondLanguage;
  dynamic _primaryLanguage;

  int get signatureStatus => _signatureStatus;
  int get voterSupportLevel => _voterSupportLevel;
  String get notes => _notes;
  String get email => _email;
  String get phone => _phone;
  String get signature => _signature;
  bool get hasIssueEducation => _hasIssueEducation;
  bool get hasIssuePolicing => _hasIssuePolicing;
  bool get hasIssueHousing => _hasIssueHousing;
  bool get hasIssueHealthcare => _hasIssueHealthcare;
  bool get hasIssueBusiness => _hasIssueBusiness;
  bool get hasIssueEnvironment => _hasIssueEnvironment;
  bool get hasIssueGunViolence => _hasIssueGunViolence;
  bool get hasIssueEthics => _hasIssueEthics;
  bool get hasEnglishAsSecondLanguage => _hasEnglishAsSecondLanguage;
  dynamic get primaryLanguage => _primaryLanguage;

  Support({
      int signatureStatus, 
      int voterSupportLevel, 
      String notes, 
      String email, 
      String phone, 
      String signature, 
      bool hasIssueEducation, 
      bool hasIssuePolicing, 
      bool hasIssueHousing, 
      bool hasIssueHealthcare, 
      bool hasIssueBusiness, 
      bool hasIssueEnvironment, 
      bool hasIssueGunViolence, 
      bool hasIssueEthics, 
      bool hasEnglishAsSecondLanguage, 
      dynamic primaryLanguage}){
    _signatureStatus = signatureStatus;
    _voterSupportLevel = voterSupportLevel;
    _notes = notes;
    _email = email;
    _phone = phone;
    _signature = signature;
    _hasIssueEducation = hasIssueEducation;
    _hasIssuePolicing = hasIssuePolicing;
    _hasIssueHousing = hasIssueHousing;
    _hasIssueHealthcare = hasIssueHealthcare;
    _hasIssueBusiness = hasIssueBusiness;
    _hasIssueEnvironment = hasIssueEnvironment;
    _hasIssueGunViolence = hasIssueGunViolence;
    _hasIssueEthics = hasIssueEthics;
    _hasEnglishAsSecondLanguage = hasEnglishAsSecondLanguage;
    _primaryLanguage = primaryLanguage;
}

  Support.fromJson(dynamic json) {
    _signatureStatus = json["signatureStatus"];
    _voterSupportLevel = json["voterSupportLevel"];
    _notes = json["notes"];
    _email = json["email"];
    _phone = json["phone"];
    _signature = json["signature"];
    _hasIssueEducation = json["hasIssueEducation"];
    _hasIssuePolicing = json["hasIssuePolicing"];
    _hasIssueHousing = json["hasIssueHousing"];
    _hasIssueHealthcare = json["hasIssueHealthcare"];
    _hasIssueBusiness = json["hasIssueBusiness"];
    _hasIssueEnvironment = json["hasIssueEnvironment"];
    _hasIssueGunViolence = json["hasIssueGunViolence"];
    _hasIssueEthics = json["hasIssueEthics"];
    _hasEnglishAsSecondLanguage = json["hasEnglishAsSecondLanguage"];
    _primaryLanguage = json["primaryLanguage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["signatureStatus"] = _signatureStatus;
    map["voterSupportLevel"] = _voterSupportLevel;
    map["notes"] = _notes;
    map["email"] = _email;
    map["phone"] = _phone;
    map["signature"] = _signature;
    map["hasIssueEducation"] = _hasIssueEducation;
    map["hasIssuePolicing"] = _hasIssuePolicing;
    map["hasIssueHousing"] = _hasIssueHousing;
    map["hasIssueHealthcare"] = _hasIssueHealthcare;
    map["hasIssueBusiness"] = _hasIssueBusiness;
    map["hasIssueEnvironment"] = _hasIssueEnvironment;
    map["hasIssueGunViolence"] = _hasIssueGunViolence;
    map["hasIssueEthics"] = _hasIssueEthics;
    map["hasEnglishAsSecondLanguage"] = _hasEnglishAsSecondLanguage;
    map["primaryLanguage"] = _primaryLanguage;
    return map;
  }

}