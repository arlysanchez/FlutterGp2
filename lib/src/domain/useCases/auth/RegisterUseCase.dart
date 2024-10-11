import 'package:shopy_file_gp2/src/domain/models/User.dart';
import 'package:shopy_file_gp2/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
AuthRepository repository;
  
  RegisterUseCase(this.repository);
  run(User user) => repository.register(user);

}