import 'package:shopy_file_gp2/src/domain/models/AuthResponse.dart';
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
AuthRepository authRepository;
SaveUserSessionUseCase(this.authRepository);

run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);

}