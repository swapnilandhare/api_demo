import 'package:api_demo/api/api_service.dart';
import 'package:api_demo/app/app.router.dart';
import 'package:api_demo/app/locator.dart';
import 'package:api_demo/model/user_response.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  int _count = 0;
  int get count => _count;

  String _userName = "dummy_username";
  String get userName => _userName;

  String _name = "dummy_name";
  String get name => _name;

  String _email = "dummy_email";
  String get email => _email;

  String _phone = "dummy_phone";
  String get phone => _phone;

  String _website = "dummy_website";
  String get website => _website;

  Future<void> getUserName() async {
    try {
      UserResponse response = await _apiService.getUserDetails();
      debugPrint("User Response is $response");
      if (response != null) {
        _userName = response.username!;
        _name = response.name!;
        _email = response.email!;
        _phone = response.phone!;
        _website = response.website!;
      }
      notifyListeners();
    } catch (e) {
      debugPrint("Error is $e");
    }
  }

  void goToDetails() {
    _navigationService.navigateTo(Routes.welcomView);
  }
}
