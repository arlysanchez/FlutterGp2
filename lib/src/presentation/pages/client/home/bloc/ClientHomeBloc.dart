import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_file_gp2/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:shopy_file_gp2/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {

 AuthUseCases authUseCases;


  ClientHomeBloc(this.authUseCases):super(ClientHomeState()){
   on<ClientLogout> (_onClientLogout);
   on<ClientChangeDrawerPage> (_onClientChangeDrawerPage);
  }

  Future<void> _onClientLogout(ClientLogout event, Emitter <ClientHomeState> emit) async {
   await authUseCases.logout.run();
  }
  
  Future<void> _onClientChangeDrawerPage(ClientChangeDrawerPage event, Emitter <ClientHomeState> emit) async {
   emit(
    state.copyWith(
      pageIndex: event.pageIndex
    )
   );
  }
  
  


}