import 'dart:io';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:multi_image_crop/multi_image_crop.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
part 'user_image_event.dart';
part 'user_image_state.dart';

class UserImageBloc extends Bloc<UserImageEvent, UserImageState> {
  final UserBloc userBloc;
  UserImageBloc({
    required this.userBloc,
  }) : super(UserImageState()) {
    on<SelectImage>(_onSelectImage);
    on<UserProfileImageCroppedImagesSelected>(
        _onUserProfileImageCroppedImagesSelected);
  }

  void _onSelectImage(
    SelectImage event,
    Emitter<UserImageState> emit,
  ) async {
    try {
      emit(state.copyWith(
        userImageStatus: UserImageStatus.picking,
      ));
      XFile? pickedFile = await ImagePicker().pickImage(
        source: event.imageSource,
      );

      if (pickedFile == null) {
        throw Exception(
          "Unable to get image",
        );
      } else {
        // CroppedFile? cropped = await ImageCropper().cropImage(
        //   sourcePath: pickedFile.path,
        //   aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        //   aspectRatioPresets: [
        //     CropAspectRatioPreset.square,
        //     // CropAspectRatioPreset.ratio3x2,
        //     // CropAspectRatioPreset.original,
        //     // CropAspectRatioPreset.ratio4x3,
        //     // CropAspectRatioPreset.ratio16x9
        //   ],
        //   uiSettings: [
        //     AndroidUiSettings(
        //       toolbarTitle: 'Crop',
        //       cropGridColor: primaryColor,
        //       initAspectRatio: CropAspectRatioPreset.original,
        //       lockAspectRatio: false,
        //     ),
        //     IOSUiSettings(
        //       title: 'Crop',
        //     ),
        //   ],
        // );

        // ignore: use_build_context_synchronously
        MultiImageCrop.startCropping(
            context: event.context,
            aspectRatio: 1 / 1,
            activeColor: primaryColor,
            pixelRatio: 3,
            files: List.generate(1, (index) => File(pickedFile.path)),
            callBack: (List<File> images) {
              add(UserProfileImageCroppedImagesSelected(images[0]));
            });
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    } catch (e) {
      print(e);
      debugPrint("Unable to open images");
    }
  }

  void _onUserProfileImageCroppedImagesSelected(
    UserProfileImageCroppedImagesSelected event,
    Emitter<UserImageState> emit,
  ) async {
    emit(
      state.copyWith(
        pickedFile: XFile(event.croppedImage.path),
        userImageStatus: UserImageStatus.uploading,
      ),
    );
    try {
      User currentUser = await ParseUser.currentUser();
      final user = await _updateProfile(currentUser);
      userBloc.add(
        UserChanged(
          user: user,
        ),
      );
      emit(
        state.copyWith(
          userImageStatus: UserImageStatus.success,
        ),
      );
    } on ErrorResponse catch (e) {
      emit(
        state.copyWith(
          userImageStatus: UserImageStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        userImageStatus: UserImageStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<User> _updateProfile(User updateUser) async {
    ParseFileBase? parseFile = ParseFile(
      File(state.pickedFile!.path),
    );
    await parseFile.save();

    var user = updateUser
      ..imageThumbnailUrl = parseFile.url
      ..imageThumbnail = parseFile;

    var response = await user.save();

    if (response.success) {
      return user;
    } else {
      throw ErrorResponse(message: response.error?.message);
    }
  }
}
