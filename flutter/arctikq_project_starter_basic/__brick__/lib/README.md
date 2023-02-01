# Your pubspec.yaml file

## dependencies


  sizer: ^2.0.15
  cached_network_image: ^3.2.1
  path_provider: ^2.0.11
  share_plus: ^4.0.10
  image_picker: ^0.8.3+3   # may remove
  url_launcher: ^6.1.5
  awesome_notifications: ^0.7.4+1
  connectivity_wrapper: ^1.1.0


## dev_dependencies
  flutter_launcher_icons: ^0.11.0

## flutter section

flutter:
  generate: true
  uses-material-design: true

  assets:
    - assets/images/

## for creating icons
flutter_icons:
  android: "ic_launcher"
  adaptive_icon_background: "assets/images/logo.png"
  ios: true
  image_path: "assets/images/logo.png"
