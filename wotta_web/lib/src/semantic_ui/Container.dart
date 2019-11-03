@JS()
library semantic_container;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';

@JS('semanticUIReact')
class _Container {
  external static ReactClass get Container;
}

final SemanticContainer = ReactJsComponentFactoryProxy(_Container.Container);
