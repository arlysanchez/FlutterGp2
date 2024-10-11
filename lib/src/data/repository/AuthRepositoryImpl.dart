import 'package:shopy_file_gp2/src/data/dataSource/local/SharedPref.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/models/User.dart';
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';
import 'package:shopy_file_gp2/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository{

AuthServices authServices;
SharedPref sharedPref;

AuthRepositoryImpl(this.authServices, this.sharedPref);

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharedPref.read('user');
    if(data !=null){
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
   return authServices.login(email, password);
  }

  @override
  Future<bool> logout() async {
   return await sharedPref.remove('user');
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authServices.register(user);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }



}