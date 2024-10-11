import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/injection.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:shopy_file_gp2/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';

List<BlocProvider> blocProvider = [
BlocProvider<LoginBloc>(create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent())),
BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
   
 BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),


];