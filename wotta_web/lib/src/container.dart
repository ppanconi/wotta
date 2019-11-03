part of './wotta_components.dart';


@Factory()
UiFactory<ContainerProps> Container = _$Container;

@Props()
class _$ContainerProps extends UiProps {
  WottaAppState state;
  WottaActions actions;
}

@State()
class _$ContainerState extends UiState {
  String appPart;
}

@Component()
class ContainerComponent extends UiStatefulComponent<ContainerProps, ContainerState> {
// --------------------------------------------------------------------------
// React Component Specifications and Lifecycle Methods
// --------------------------------------------------------------------------

  @override
  Map getDefaultProps() => (newProps());

  @override
  Map getInitialState() => (
      newState()..appPart = 'workouts'
  );

  @override
  render() {
    return SemanticContainer({
      "style": { "margin": 20 }
    }, Menu()()
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