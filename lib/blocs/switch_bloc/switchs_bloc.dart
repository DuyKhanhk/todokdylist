// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:todokdylist/blocs/bloc_exports.dart';

part 'switchs_event.dart';
part 'switchs_state.dart';

class SwitchsBloc extends HydratedBloc<SwitchsEvent, SwitchsState> {
  SwitchsBloc() : super(const SwitchsInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwitchsState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchsState(switchValue: false));
    });
  }

  @override
  SwitchsState? fromJson(Map<String, dynamic> json) {
    return SwitchsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchsState state) {
    return state.toMap();
  }
}
