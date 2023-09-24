class AppApiData {
  static const String scheme = 'https';
  static const String host = 'fortress-events-backend.vercel.app';
  // static const String host = 'apidev.poliliod.com';
// http://ec2-18-119-101-235.us-east-2.compute.amazonaws.com:3000/api/users
//!http://ec2-18-119-101-235.us-east-2.compute.amazonaws.com:3000/api/events
  ///?main uri
  static Uri baseUri(String path) => Uri(
        scheme: scheme,
        host: host,
        path: '/api/$path',
        // port: 3000,
      );
  // static Uri baseUri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
}
