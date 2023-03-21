part of 'switchs_bloc.dart';

abstract class SwitchsEvent extends Equatable {
  const SwitchsEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchsEvent {}

class SwitchOffEvent extends SwitchsEvent {}
