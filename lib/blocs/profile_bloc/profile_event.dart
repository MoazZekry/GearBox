import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfile extends ProfileEvent {
  final String userName;
  final String imageUrl;

  const UpdateProfile(this.userName, this.imageUrl);
}
