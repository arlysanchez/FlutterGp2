import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {
AuthRepository authRepository;

GetUserSessionUseCase(this.authRepository);

run() => authRepository.getUserSession();

}