enum ServicePathEnum{BASE_URL}

extension ServicePathEnumExtension on ServicePathEnum{
  String get rawValue{
    switch (this) {
      case ServicePathEnum.BASE_URL:
        return 'http://jsonplaceholder.typicode.com/';
      default:
      throw Exception('Not found path');
    }
  }
} 