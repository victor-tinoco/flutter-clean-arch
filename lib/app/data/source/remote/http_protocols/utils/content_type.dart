enum CustomContentType {
  APPLICATION_JSON,
  MULTIPART_FORM_DATA,
}

extension ContentTypeExtension on CustomContentType {
  static const Map<CustomContentType, String> _map = {
    CustomContentType.APPLICATION_JSON: 'application/json',
    CustomContentType.MULTIPART_FORM_DATA: 'multipart/form-data',
  };

  String get headerParameter => _map[this];
}
