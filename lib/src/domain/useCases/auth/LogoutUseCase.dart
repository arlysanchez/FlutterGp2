import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {

AuthRepository repository;
LogoutUseCase (this.repository);

run() => repository.logout();
}