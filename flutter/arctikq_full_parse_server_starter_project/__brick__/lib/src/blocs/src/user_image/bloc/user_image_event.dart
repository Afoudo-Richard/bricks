part of 'user_image_bloc.dart';

@immutable
abstract class UserImageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectImage extends UserImageEvent {
  final ImageSource imageSource;
  final BuildContext context;

  SelectImage({
    required this.imageSource,
    required this.context,
  });
}

class UserProfileImageCroppedImagesSelected extends UserImageEvent {
  UserProfileImageCroppedImagesSelected(this.croppedImage);

  final File croppedImage;

  @override
  List<Object> get props => [croppedImage];
}
