import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shopy_file_gp2/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencias() async => await locator.init();