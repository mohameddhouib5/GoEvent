import 'package:go_event/main.dart' as entrypoint;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy()); // Use path-based routing for the web
  entrypoint.main(
      <String>[]); // Call the main function with an empty list of arguments
}
