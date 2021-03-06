import React, {Component} from 'react';
// import './App.css';
import Main from "./components/Main";
import { webSocket } from "rxjs/webSocket";
import { State, AppState } from "./state/State";

class App extends Component {
    constructor(props, context) {
        super(props, context);
        this.appState = new State();
    }

    async componentDidMount() {
        this.getConfigNConnect();
    }

    async getConfigNConnect() {

        // console.log('DEBUG calling api config ...');

        const path = 'api/config';
        try {
            // Make the GET request
            const response = await fetch(path);
            const config = await response.json();

            this.appState.config = config;

            // console.log(`DEBUG config ${JSON.stringify(config)}`);
            const url = new URL(window.location.href);

            const wsUrl = new URL('ws://' + url.host + config.web_websocket_uri);

            this.wsSubject = webSocket(wsUrl.href);
            this.appState.openSession(this.wsSubject);

        } catch (e) {
            // The GET request failed. Handle the error.
            console.log(`Error: ${e}`);
            throw Error('Request failed.');
        }
    }

    render() {
        return (
            <AppState.Provider value={this.appState}>
                <Main></Main>
            </AppState.Provider>
        );
    }
}

export default App;