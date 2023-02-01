// modify path base on taste

extension ImagePath on String {
  String get toSvg => "assets/images/$this.svg";
  String get toPng => "assets/images/$this.png";
  String get toJpg => "assets/images/$this.jpg";
}
