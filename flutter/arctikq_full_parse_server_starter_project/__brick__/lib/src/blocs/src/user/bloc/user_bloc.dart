import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/{{project_name.snakeCase()}}.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:external_path/external_path.dart';

// http
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as path;
// import 'package:permission_handler/permission_handler.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UserChanged>(_onUserChanged);
    on<UserLanguangeChanged>(_onUserLanguangeChanged);
    on<UserImageDownload>(_onUserImageDownload);

    LiveQueryStreams.userUpdateStream.stream.listen((User user) {
      if (state.user != null && user.objectId == state.user!.objectId) {
        emit(
          state.copyWith(
            user: user,
            checker: !state.checker,
          ),
        );
      }
    });
  }

  void _onUserImageDownload(
    UserImageDownload event,
    Emitter<UserState> emit,
  ) async {
    if (state.user!.imageThumbnailUrl != null) {
      // debugPrint('Inside download ^^^^^^^^^^^^');
      // final response = await downloadFile(state.user!.imageThumbnailUrl!,
      //     'UserImage', '/downloads/GleicheFoundation');

      // final filePath = await downloadParseFile(
      //     state.user!.imageThumbnailUrl!.split('/').last);

      // final filePath = await downloadParseFile(state.user!.imageThumbnailUrl!);
      // debugPrint('Parsefile saved to: $filePath');

      final fileDownloaded =
          await _downloadImage(state.user!.imageThumbnailUrl!);

      // User user = await ParseUser.currentUser();

      // debugPrint("inside download &&&&&&&&&&&&&&&");
      // final response = await user.imageThumbnail?.download(
      //   progressCallback: (count, total) {
      //     debugPrint('count - $count');
      //     debugPrint('total - $total');
      //   },
      // );

      // debugPrint(response);
    }

    // return emit(
    //   state.copyWith(
    //     user: event.user,
    //     checker: !state.checker,
    //   ),
    // );
  }

  int _total = 0, _received = 0;
  late http.StreamedResponse _response;
  File? _image;
  final List<int> _bytes = [];

  // Future<void> _downloadImage(String urlLink) async {
  //   _response =
  //       await http.Client().send(http.Request('GET', Uri.parse(urlLink)));
  //   _total = _response.contentLength ?? 0;

  //   _response.stream.listen((value) {
  //     debugPrint(value.toString());
  //     // setState(() {
  //     //   _bytes.addAll(value);
  //     //   _received += value.length;
  //     // });
  //   }).onDone(() async {
  //     // final file = File(
  //     //     '${(await path.getApplicationDocumentsDirectory() ).path}/image.png');

  //     Permission storagePermission = Permission.storage;

  //     if (await storagePermission.isDenied) {
  //       throw Exception('Storage permission is required to download the file.');
  //     }

  //     final file = File(
  //         '${(await ExternalPath.getExternalStorageDirectories())[0]}/image12.png');
  //     await file.writeAsBytes(_bytes);
  //     // setState(() {
  //     //   _image = file;
  //     // });

  //     debugPrint(file.path);
  //   });
  // }

  // Future<String> downloadParseFileToDownloadsFolderWithProgressPercentage(
  //     String parseFileId,
  //     String fileName,
  //     Function(int progressPercentage) onProgress) async {
  //   // Check if the app has permission to access the downloads folder
  //   // final status =
  //   //     await PermissionHandler().checkPermissionStatus(Permission.storage);
  //   Permission storagePermission = Permission.storage;

  //   if (await storagePermission.isDenied) {
  //     throw Exception('Storage permission is required to download the file.');
  //   }

  //   // if (status != PermissionStatus.granted) {
  //   //   // Request permission if not granted
  //   //   final status =
  //   //       await PermissionHandler().requestPermissions([Permission.storage]);
  //   //   if (status[Permission.storage] != PermissionStatus.granted) {
  //   //     throw Exception('Storage permission is required to download the file.');
  //   //   }
  //   // }

  //   // Download the parsefile with progress tracking
  //   final url = Uri.parse(parseFileId);
  //   final headers = {
  //     'X-Parse-Application-Id': '<YOUR_APPLICATION_ID>',
  //     'X-Parse-Client-Key': '<YOUR_CLIENT_KEY>'
  //   };

  //   final request = await http.head(url, headers: headers);
  //   final contentLength = int.parse(request.headers['content-length'] ?? '0');

  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to download parsefile: ${response.statusCode}');
  //   }

  //   // Save the parsefile to the downloads folder while tracking progress in percentage
  //   final downloadsDirectory = await path.getDownloadsDirectory();
  //   final filePath = '${downloadsDirectory!.path}/$fileName';

  //   int downloadedBytes = 0;

  //   // await response.bodyBytes.listen((chunk) {
  //   //   downloadedBytes += chunk.length;
  //   //   final progressPercentage = (downloadedBytes / contentLength) * 100;
  //   //   onProgress(progressPercentage.toInt());

  //   //   if (downloadedBytes == contentLength) {
  //   //     // Download completed
  //   //     File(filePath).writeAsBytes(response.bodyBytes);
  //   //   }
  //   // });

  //   return filePath;
  // }

  // Future<String> downloadParseFile(String parseFileId) async {
  //   // final url = Uri.parse('https://parsefiles.back4app.com/$parseFileId');
  //   final url = Uri.parse(parseFileId);

  //   Map<String, String> headers = {
  //     // 'X-Parse-Application-Id': AppConfigs.keyApplicationId,
  //     // 'X-Parse-Client-Key': AppConfigs.keyClientKey,
  //   };

  //   final response = await http.get(url, headers: headers);

  //   if (response.statusCode == 200) {
  //     // final directory = await path.getTemporaryDirectory();
  //     final filename = '${DateTime.now().millisecondsSinceEpoch}.parsefile';
  //     // final filePath = '${directory.path}/$filename';

  //     final downloadsDirectory = await path.getExternalStorageDirectory();
  //     final filePath = '${downloadsDirectory!.path}/$filename';

  //     await File(filePath).writeAsBytes(response.bodyBytes);
  //     return filePath;
  //   } else {
  //     throw Exception('Failed to download parsefile: ${response.statusCode}');
  //   }
  // }

  Future<String> downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url + '/' + fileName;

      // var request = await httpClient.getUrl(Uri.parse(myUrl));
      // var request = await httpClient.postUrl(Uri.parse(myUrl));
      // var request = await httpClient.post(Uri.parse(myUrl));

      // var response = await request.close();

      HttpClient client = HttpClient();
      client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
        // Optionally set up headers...
        // Optionally write to the request object...
        // Then call close.
        // request.headers
        //     .add(' Parse-Application-Id', AppConfigs.keyApplicationId);
        return request.close();
      }).then((HttpClientResponse response) async {
        // Process the response.
        if (response.statusCode == 200) {
          var bytes = await consolidateHttpClientResponseBytes(response);
          filePath = '$dir/$fileName';
          file = File(filePath);
          await file.writeAsBytes(bytes);
        } else
          filePath = 'Error code: ' + response.statusCode.toString();
      });

      // if (response.statusCode == 200) {
      //   var bytes = await consolidateHttpClientResponseBytes(response);
      //   filePath = '$dir/$fileName';
      //   file = File(filePath);
      //   await file.writeAsBytes(bytes);
      // } else
      //   filePath = 'Error code: ' + response.statusCode.toString();
    } catch (ex) {
      filePath = 'Can not fetch url';
    }

    return filePath;
  }

  void _onUserChanged(
    UserChanged event,
    Emitter<UserState> emit,
  ) async {
    return emit(
      state.copyWith(
        user: event.user,
        checker: !state.checker,
      ),
    );
  }

  void _onUserLanguangeChanged(
    UserLanguangeChanged event,
    Emitter<UserState> emit,
  ) async {
    return emit(
      state.copyWith(
        locale: event.locale,
      ),
    );
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
