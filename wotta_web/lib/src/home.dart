`
part of 'wotta_components.dart';

@Factory()
UiFactory<HomeComponentProps> HomeComponent = _$HomeComponent;

@Props()
class _$HomeComponentProps extends BuiltReduxUiProps<WottaAppState, WottaAppStateBuilder, WottaActions> {
}

@Component()
class HomeComponentComponent extends BuiltReduxUiComponent<
    WottaAppState, WottaAppStateBuilder, WottaActions, HomeComponentProps, WottaAppState> {
// --------------------------------------------------------------------------
// React Component Specifications and Lifecycle Methods
// --------------------------------------------------------------------------

  @override
  Map getDefaultProps() => (newProps());

  WottaAppState connect(WottaAppState state) {
    return state;
  }

  @override
  render() {
//    props.store.state.workouts
    return (Dom.div()..className = 'container')(
        Dom.h1()("Wotta"),
        Dom.p()("You have ${props.store.state.workouts.length} workouts")
    );

  }


  
// --------------------------------------------------------------------------
// Private Utility Methods
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Public Utility Methods
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Public A Methods
// --------------------------------------------------------------------------
}