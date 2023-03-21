// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'switchs_bloc.dart';

class SwitchsState extends Equatable {
  const SwitchsState({required this.switchValue});
  final bool switchValue;
  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchsState.fromMap(Map<String, dynamic> map) {
    return SwitchsState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

class SwitchsInitial extends SwitchsState {
  const SwitchsInitial({required bool switchValue}) : super(switchValue: switchValue);
}
