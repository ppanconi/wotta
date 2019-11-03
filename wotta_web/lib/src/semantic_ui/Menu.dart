@JS()
library semantic_menu;

import 'package:js/js.dart';
import 'package:react/react_client.dart';
import 'package:react/react_client/react_interop.dart';

@JS('semanticUIReact')
class SemanticMenu {
  external static ReactClass get Menu;
}

@JS('semanticUIReact.Menu')
class _SemanticMenuItem {
  external static ReactClass get Item;
}

final SemanticMenuMenu = ReactJsComponentFactoryProxy(SemanticMenu.Menu);
final SemanticMenuItem = ReactJsComponentFactoryProxy(_SemanticMenuItem.Item);

