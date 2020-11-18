class DashboardResponse {
  int _registeredVotersCount;
  int _targetedSignaturesCount;
  int _collectedSignaturesCount;

  int get registeredVotersCount => _registeredVotersCount;
  int get targetedSignaturesCount => _targetedSignaturesCount;
  int get collectedSignaturesCount => _collectedSignaturesCount;

  DashboardResponse({
      int registeredVotersCount, 
      int targetedSignaturesCount, 
      int collectedSignaturesCount}){
    _registeredVotersCount = registeredVotersCount;
    _targetedSignaturesCount = targetedSignaturesCount;
    _collectedSignaturesCount = collectedSignaturesCount;
}

  DashboardResponse.fromJson(dynamic json) {
    _registeredVotersCount = json["registeredVotersCount"];
    _targetedSignaturesCount = json["targetedSignaturesCount"];
    _collectedSignaturesCount = json["collectedSignaturesCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["registeredVotersCount"] = _registeredVotersCount;
    map["targetedSignaturesCount"] = _targetedSignaturesCount;
    map["collectedSignaturesCount"] = _collectedSignaturesCount;
    return map;
  }

}