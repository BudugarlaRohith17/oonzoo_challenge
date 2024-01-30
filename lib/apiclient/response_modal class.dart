class UniversityResponse {
  String? name;
  List<String>? webPages;
  String? country;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;

  UniversityResponse({
    this.name,
    this.webPages,
    this.country,
    this.domains,
    this.alphaTwoCode,
    this.stateProvince,
  });

  factory UniversityResponse.fromJson(Map<String, dynamic> json) {
    return UniversityResponse(
      name: json["name"],
      webPages: List<String>.from(json["web_pages"].map((x) => x)),
      country: json["country"],
      domains: List<String>.from(json["domains"].map((x) => x)),
      alphaTwoCode: json["alpha_two_code"],
      stateProvince: json["state-province"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
      "country": country,
      "domains": List<dynamic>.from(domains!.map((x) => x)),
      "alpha_two_code": alphaTwoCode,
      "state-province": stateProvince,
    };
  }
}
