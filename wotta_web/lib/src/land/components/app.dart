part of './components.dart';

@Factory()
UiFactory<AppProps> App = _$App;

@Props()
class _$AppProps extends UiProps {
  AppStatus initialStatus;
  WebSocket webSocket;
}

@State()
class _$AppState extends UiState {
  AppStatus status;
  String key;
  Store store;
}

enum AppStatus { loading, connected, closed }

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
      ..key = null
      ..store = null;
  }

  @override
  void componentDidMount() {
    super.componentDidMount();
    props.webSocket.onMessage.listen((MessageEvent e) {
      print('DEBUG revieved message: ${e.data}');
      var msg = jsonDecode(e.data);
      if (msg['type'] == 'KEY') {
        updateKey(msg['key']);
      } else if (msg['type'] == 'CHANNEL_READY') {
        print('channel is ready');
        props.webSocket.send(e.data);
      } else if (msg['type'] == 'STATE_DATA') {
        print('data state recieved');

        var stateData = msg['data'];
        WottaAppState state = standardSerializers.deserializeWith(
            WottaAppState.serializer, json.decode(stateData));
        var _store = Store(wottaReducerBuilder.build(), state, WottaActions());
        updateStatus(AppStatus.connected, _store);
      }
    });

    props.webSocket.onOpen.listen((e) {
      print('DEBUG WS Connected');
      props.webSocket.send('hello');
    });

    props.webSocket.onClose.listen((e) {
      print('DEBUG WS Closed');
      updateStatus(AppStatus.closed);
      Timer(Duration(seconds:4), () => window.location.reload());
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
    if (state.status == AppStatus.loading) {
      if (state.key == null) {
        return (Dom.div()
          ..className = 'container')(Dom.h1()("Wotta loading..."));
      } else {
        ReactElement canvas = (Dom.canvas()
          ..height = 400
          ..width = 400
          ..id = 'content')();
        return canvas;
      }
    } else if (state.status == AppStatus.connected) {
      return (HomeComponent()..store = state.store)();
    } else if (state.status == AppStatus.closed) {
      return (Dom.div()
        ..className = 'container')(Dom.h1()("Connection to your phone it's lost"));
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

  void updateStatus(AppStatus status, [Store store]) => setState(newState()
    ..status = status
    ..key = null
    ..store = store);

  void updateKey(String key) => setState(newState()..key = key);
}
