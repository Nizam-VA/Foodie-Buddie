part of 'profile_bloc.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateUserProfileEvent extends ProfileEvent {
  final Profile profile;
  final BuildContext context;
  UpdateUserProfileEvent({required this.profile, required this.context});
}
