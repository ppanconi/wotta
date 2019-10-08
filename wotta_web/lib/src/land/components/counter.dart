part of 'components.dart';

@Factory()
UiFactory<CounterProps> Counter = _$Counter;

@Props()
class _$CounterProps extends UiProps {
  // Props go here, declared as fields:
  int increment;
  int initialValue;
}

@State()
class _$CounterState extends UiState {
  int currentValue;
}

@Component()
class CounterComponent extends UiStatefulComponent<CounterProps, CounterState> {
  @override
  Map getDefaultProps() => (newProps()
  // Cascade default props here
    ..increment = 1
    ..initialValue = 0
  );

  @override
  Map getInitialState() {
    return newState()..currentValue = props.initialValue;
  }

  void _increment() => setState(
    newState()..currentValue = state.currentValue + props.increment
  );

  @override
  render() {
    // Return the rendered component contents here.
    // The `props` variable is typed; no need for string keys!
    return (Dom.div()..className = 'counter')(
        Dom.p()('Current value ${state.currentValue}'),
        (Button()
            ..onClick = (_) => _increment()
        )('Increment by ${props.increment}')
    );
  }
}
