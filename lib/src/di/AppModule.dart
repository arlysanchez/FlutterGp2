
import 'package:injectable/injectable.dart';
import 'package:shopy_file_gp2/src/data/dataSource/local/SharedPref.dart';
import 'package:shopy_file_gp2/src/data/dataSource/remote/services/AuthServices.dart';
import 'package:shopy_file_gp2/src/data/repository/AuthRepositoryImpl.dart';
import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

@module
abstract class AppModule {

@injectable
SharedPref get sharedPref => SharedPref(); 

@injectable
Future <String> get token async{
String token = "";
final userSession = await sharedPref.read('user');
if(userSession != null){
  AuthResponse authResponse = AuthResponse.fromJson(userSession);
  token =authResponse.token;
}
return token;

}



//services
@injectable
AuthServices get authServices => AuthServices();

//repository
@injectable
AuthRepository get authRepository => AuthRepositoryImpl(authServices,sharedPref);

//Use Cases
@injectable
AuthUseCases get authUseCases => AuthUseCases
(login:LoginUseCase(authRepository),
 register: RegisterUseCase(authRepository),
 getUserSession: GetUserSessionUseCase(authRepository),
 saveUserSession: SaveUserSessionUseCase(authRepository),
 logout: LogoutUseCase(authRepository)

 ); 

}