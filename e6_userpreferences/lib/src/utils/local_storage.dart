import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  
  static final LocalStorage _instance = new LocalStorage._();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._();

  SharedPreferences _prefs;

  Future<SharedPreferences> initPrefs() async {
    return _prefs = await SharedPreferences.getInstance();
  }

  int get gender => _prefs.getInt('gender') ?? 1;

  set gender (int value) => _prefs.setInt('gender', value);

  String get username => _prefs.getString('username') ?? 'Jesús';

  set username (String value) => _prefs.setString('username', value);

  bool get secondary => _prefs.getBool('secondary') ?? false;

  set secondary (bool value) => _prefs.setBool('secondary', value);

  String get lastPage => _prefs.getString('last_page') ?? 'home';

  set lastPage (String value) => _prefs.setString('last_page', value);

}