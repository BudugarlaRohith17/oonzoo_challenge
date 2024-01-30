import 'package:flutter/material.dart';
import '../apiclient/response_modal class.dart';

class UniversityProvider extends ChangeNotifier {
  List<UniversityResponse> _universities = [];

  List<UniversityResponse> get universities => _universities;

  void setUniversities(List<UniversityResponse> universities) {
    _universities = universities;
    notifyListeners();
  }
}
