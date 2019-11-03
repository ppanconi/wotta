@JS()
library semantic_input;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';

@JS('semanticUIReact')
class SemanticUIReact {
  external static ReactClass get Input;
}

final ReactJsComponentFactoryProxy SemanticInput = ReactJsComponentFactoryProxy(SemanticUIReact.Input);
