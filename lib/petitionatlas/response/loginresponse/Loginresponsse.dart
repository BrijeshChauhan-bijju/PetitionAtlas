class Loginresponsse {
  int _id;
  String _username;
  bool _isAdmin;
  int _mainCampaignId;
  String _mainCampaignName;
  String _mainCampaignEmail;
  dynamic _mainCampaignSignatureGoal;
  List<Campaigns> _campaigns;
  Tokens _tokens;

  int get id => _id;
  String get username => _username;
  bool get isAdmin => _isAdmin;
  int get mainCampaignId => _mainCampaignId;
  String get mainCampaignName => _mainCampaignName;
  String get mainCampaignEmail => _mainCampaignEmail;
  dynamic get mainCampaignSignatureGoal => _mainCampaignSignatureGoal;
  List<Campaigns> get campaigns => _campaigns;
  Tokens get tokens => _tokens;

  Loginresponsse({
      int id, 
      String username, 
      bool isAdmin, 
      int mainCampaignId, 
      String mainCampaignName, 
      String mainCampaignEmail, 
      dynamic mainCampaignSignatureGoal, 
      List<Campaigns> campaigns, 
      Tokens tokens}){
    _id = id;
    _username = username;
    _isAdmin = isAdmin;
    _mainCampaignId = mainCampaignId;
    _mainCampaignName = mainCampaignName;
    _mainCampaignEmail = mainCampaignEmail;
    _mainCampaignSignatureGoal = mainCampaignSignatureGoal;
    _campaigns = campaigns;
    _tokens = tokens;
}

  Loginresponsse.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["username"];
    _isAdmin = json["isAdmin"];
    _mainCampaignId = json["mainCampaignId"];
    _mainCampaignName = json["mainCampaignName"];
    _mainCampaignEmail = json["mainCampaignEmail"];
    _mainCampaignSignatureGoal = json["mainCampaignSignatureGoal"];
    if (json["campaigns"] != null) {
      _campaigns = [];
      json["campaigns"].forEach((v) {
        _campaigns.add(Campaigns.fromJson(v));
      });
    }
    _tokens = json["tokens"] != null ? Tokens.fromJson(json["tokens"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["username"] = _username;
    map["isAdmin"] = _isAdmin;
    map["mainCampaignId"] = _mainCampaignId;
    map["mainCampaignName"] = _mainCampaignName;
    map["mainCampaignEmail"] = _mainCampaignEmail;
    map["mainCampaignSignatureGoal"] = _mainCampaignSignatureGoal;
    if (_campaigns != null) {
      map["campaigns"] = _campaigns.map((v) => v.toJson()).toList();
    }
    if (_tokens != null) {
      map["tokens"] = _tokens.toJson();
    }
    return map;
  }

}

class Tokens {
  String _accessToken;
  String _refreshToken;

  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;

  Tokens({
      String accessToken, 
      String refreshToken}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Tokens.fromJson(dynamic json) {
    _accessToken = json["accessToken"];
    _refreshToken = json["refreshToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["accessToken"] = _accessToken;
    map["refreshToken"] = _refreshToken;
    return map;
  }

}

class Campaigns {
  int _id;
  String _name;
  int _petitionSheetLineCount;
  bool _usesMapWalkSheets;
  bool _usesPrecinctWalkSheets;
  int _targetedSignaturesCount;
  String _email;
  dynamic _signatureGoal;
  int _mainCampaignId;
  List<SubCampaigns> _subCampaigns;
  dynamic _petitionSheets;
  bool _isMainCampaign;

  int get id => _id;
  String get name => _name;
  int get petitionSheetLineCount => _petitionSheetLineCount;
  bool get usesMapWalkSheets => _usesMapWalkSheets;
  bool get usesPrecinctWalkSheets => _usesPrecinctWalkSheets;
  int get targetedSignaturesCount => _targetedSignaturesCount;
  String get email => _email;
  dynamic get signatureGoal => _signatureGoal;
  int get mainCampaignId => _mainCampaignId;
  List<SubCampaigns> get subCampaigns => _subCampaigns;
  dynamic get petitionSheets => _petitionSheets;
  bool get isMainCampaign => _isMainCampaign;

  Campaigns({
      int id, 
      String name, 
      int petitionSheetLineCount, 
      bool usesMapWalkSheets, 
      bool usesPrecinctWalkSheets, 
      int targetedSignaturesCount, 
      String email, 
      dynamic signatureGoal, 
      int mainCampaignId, 
      List<SubCampaigns> subCampaigns, 
      dynamic petitionSheets, 
      bool isMainCampaign}){
    _id = id;
    _name = name;
    _petitionSheetLineCount = petitionSheetLineCount;
    _usesMapWalkSheets = usesMapWalkSheets;
    _usesPrecinctWalkSheets = usesPrecinctWalkSheets;
    _targetedSignaturesCount = targetedSignaturesCount;
    _email = email;
    _signatureGoal = signatureGoal;
    _mainCampaignId = mainCampaignId;
    _subCampaigns = subCampaigns;
    _petitionSheets = petitionSheets;
    _isMainCampaign = isMainCampaign;
}

  Campaigns.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _petitionSheetLineCount = json["petitionSheetLineCount"];
    _usesMapWalkSheets = json["usesMapWalkSheets"];
    _usesPrecinctWalkSheets = json["usesPrecinctWalkSheets"];
    _targetedSignaturesCount = json["targetedSignaturesCount"];
    _email = json["email"];
    _signatureGoal = json["signatureGoal"];
    _mainCampaignId = json["mainCampaignId"];
    if (json["subCampaigns"] != null) {
      _subCampaigns = [];
      json["subCampaigns"].forEach((v) {
        _subCampaigns.add(SubCampaigns.fromJson(v));
      });
    }
    _petitionSheets = json["petitionSheets"];
    _isMainCampaign = json["isMainCampaign"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["petitionSheetLineCount"] = _petitionSheetLineCount;
    map["usesMapWalkSheets"] = _usesMapWalkSheets;
    map["usesPrecinctWalkSheets"] = _usesPrecinctWalkSheets;
    map["targetedSignaturesCount"] = _targetedSignaturesCount;
    map["email"] = _email;
    map["signatureGoal"] = _signatureGoal;
    map["mainCampaignId"] = _mainCampaignId;
    if (_subCampaigns != null) {
      map["subCampaigns"] = _subCampaigns.map((v) => v.toJson()).toList();
    }
    map["petitionSheets"] = _petitionSheets;
    map["isMainCampaign"] = _isMainCampaign;
    return map;
  }

}

class SubCampaigns {
  int _id;
  String _name;
  int _petitionSheetLineCount;
  bool _usesMapWalkSheets;
  bool _usesPrecinctWalkSheets;
  int _targetedSignaturesCount;
  dynamic _email;
  dynamic _signatureGoal;
  int _mainCampaignId;
  dynamic _subCampaigns;
  dynamic _petitionSheets;
  bool _isMainCampaign;

  int get id => _id;
  String get name => _name;
  int get petitionSheetLineCount => _petitionSheetLineCount;
  bool get usesMapWalkSheets => _usesMapWalkSheets;
  bool get usesPrecinctWalkSheets => _usesPrecinctWalkSheets;
  int get targetedSignaturesCount => _targetedSignaturesCount;
  dynamic get email => _email;
  dynamic get signatureGoal => _signatureGoal;
  int get mainCampaignId => _mainCampaignId;
  dynamic get subCampaigns => _subCampaigns;
  dynamic get petitionSheets => _petitionSheets;
  bool get isMainCampaign => _isMainCampaign;

  SubCampaigns({
      int id, 
      String name, 
      int petitionSheetLineCount, 
      bool usesMapWalkSheets, 
      bool usesPrecinctWalkSheets, 
      int targetedSignaturesCount, 
      dynamic email, 
      dynamic signatureGoal, 
      int mainCampaignId, 
      dynamic subCampaigns, 
      dynamic petitionSheets, 
      bool isMainCampaign}){
    _id = id;
    _name = name;
    _petitionSheetLineCount = petitionSheetLineCount;
    _usesMapWalkSheets = usesMapWalkSheets;
    _usesPrecinctWalkSheets = usesPrecinctWalkSheets;
    _targetedSignaturesCount = targetedSignaturesCount;
    _email = email;
    _signatureGoal = signatureGoal;
    _mainCampaignId = mainCampaignId;
    _subCampaigns = subCampaigns;
    _petitionSheets = petitionSheets;
    _isMainCampaign = isMainCampaign;
}

  SubCampaigns.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _petitionSheetLineCount = json["petitionSheetLineCount"];
    _usesMapWalkSheets = json["usesMapWalkSheets"];
    _usesPrecinctWalkSheets = json["usesPrecinctWalkSheets"];
    _targetedSignaturesCount = json["targetedSignaturesCount"];
    _email = json["email"];
    _signatureGoal = json["signatureGoal"];
    _mainCampaignId = json["mainCampaignId"];
    _subCampaigns = json["subCampaigns"];
    _petitionSheets = json["petitionSheets"];
    _isMainCampaign = json["isMainCampaign"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["petitionSheetLineCount"] = _petitionSheetLineCount;
    map["usesMapWalkSheets"] = _usesMapWalkSheets;
    map["usesPrecinctWalkSheets"] = _usesPrecinctWalkSheets;
    map["targetedSignaturesCount"] = _targetedSignaturesCount;
    map["email"] = _email;
    map["signatureGoal"] = _signatureGoal;
    map["mainCampaignId"] = _mainCampaignId;
    map["subCampaigns"] = _subCampaigns;
    map["petitionSheets"] = _petitionSheets;
    map["isMainCampaign"] = _isMainCampaign;
    return map;
  }

}