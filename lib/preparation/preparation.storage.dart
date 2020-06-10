import 'package:shared_preferences/shared_preferences.dart';

// Money of preparation of action
class SharedPrefMoney {
gestionOfMoney(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setInt('money', value); 
}

Future<int> getGestionOfMoney() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('money');
}
}
