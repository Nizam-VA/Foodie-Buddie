part of 'profile_bloc.dart';

class ProfileState {
  final Profile? profile;
  ProfileState({required this.profile});
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(profile: null);
}
