part of './wotta_components.dart';

@Factory()
UiFactory<MenuProps> Menu = _$Menu;

@Props()
class _$MenuProps extends UiProps {}

@State()
class _$MenuState extends UiState {}

@Component()
class MenuComponent extends UiStatefulComponent<MenuProps, MenuState> {
// --------------------------------------------------------------------------
// React Component Specifications and Lifecycle Methods
// --------------------------------------------------------------------------

  @override
  Map getDefaultProps() => (newProps());

  @override
  Map getInitialState() => (newState());

  @override
  render() {

    return SemanticMenuMenu({},
      [
        SemanticMenuItem({'key': 'workouts'}, 'Workouts'),
        SemanticMenuItem({'key': 'exections'}, 'Exections'),
        SemanticMenuItem({'key': 'results'}, 'Results'),
      ]
    );
  }

// --------------------------------------------------------------------------
// Private Utility Methods
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Public Utility Methods
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Public API Methods
// --------------------------------------------------------------------------
}