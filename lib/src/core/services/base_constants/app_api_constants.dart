class AppApiData {
  static const String scheme = 'https';
  static const String host = '';
  // static const String host = 'apidev.poliliod.com';

  ///?main uri
  // static Uri baseUri(String path) => Uri(
  //       scheme: scheme,
  //       host: host,
  //       path: '/api/$path',
  //     );
  static Uri baseUri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
}
