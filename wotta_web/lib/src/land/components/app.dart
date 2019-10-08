part of './components.dart';

@Factory()
UiFactory<AppProps> App = _$App;

@Props()
class _$AppProps extends UiProps {
  String initialStatus;
  WebSocket webSocket;

}

@State()
class _$AppState extends UiState {
  String status;
  String key;
}


@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState> {
// --------------------------------------------------------------------------
// React Component Specifications and Lifecycle Methods
// --------------------------------------------------------------------------

  @override
  Map getDefaultProps() => (newProps());

  @override
  Map getInitialState() {
    return newState()
      ..status = props.initialStatus
      ..key = null;
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    props.webSocket.onMessage.listen((MessageEvent e) {

      print('DEBUG revieved message: ${e.data}');
      var msg = jsonDecode(e.data);
      if (msg['type'] == 'KEY') {
        updateKey(msg['key']);
      } else {
        updateStatus(e.data);
      }

      if (msg['type'] == 'PING') {
        props.webSocket.send('PONG');
      }

    });

    props.webSocket.onOpen.listen((e) {
      print('DEBUG WS Connected');
      props.webSocket.send('hello');
    });

  }

  @override
  void componentDidUpdate(Map prevProps, Map prevState) {
    super.componentDidUpdate(prevProps, prevState);
    if (state.key != null) {
      Qr(state.key);
    }
  }

  @override
  render() {

    if (state.key == null) {

      return (Dom.div()..className = 'container')("${state.status}");

    } else {
      ReactElement canvas = (Dom.canvas()
        ..height = 400
        ..width = 400
        ..id = 'content'
      )();
      return canvas;
    }


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

  void updateStatus(String status) =>
    setState(newState()..status = status
        ..key = null
    );

  void updateKey(String key) =>
      setState(newState()..key = key);
}


