import React from 'react';
import { BehaviorSubject } from 'rxjs';

export class State {

    static SESSION_LOADING = 0;
    static SESSION_REQUESTED = 5;
    static SESSION_CONNECTED = 10;
    static SESSION_CLOSED = 20;

    constructor() {
        this._remoteSessionStateSubject = new BehaviorSubject(State.SESSION_LOADING);
        this._keySubject = new BehaviorSubject(null);
        this._dataSubject = new BehaviorSubject(null);
        this._config = {};
    }

    get remoteSessionStateSubject() {
        return this._remoteSessionStateSubject;
    }

    get keySubject() {
        return this._keySubject;
    }

    get dataSubject() {
        return this._dataSubject;
    }

    get config() {
        return this._config;
    }

    set config(value) {
        this._config = value;
    }

    get key() {
        return this.keySubject.getValue();
    }

    set key(value) {
        this.keySubject.next(value);
        this.remoteSessionStateSubject.next(State.SESSION_REQUESTED)
    }

    get qrCodeValue() {
        const wsUrl = new URL(window.location.href);
        wsUrl.protocol = 'ws';
        wsUrl.pathname = this.config.app_websocket_uri;
        wsUrl.searchParams.set('key', this.key);
        console.log('INFO key ' + this.key);
        return wsUrl.href;
    }

    get remoteSessionState() {
        return this.remoteSessionStateSubject.getValue();
    }

    get data() {
        return this.dataSubject.getValue();
    }

    set data(value) {
        this.dataSubject.next(value);
        this.remoteSessionStateSubject.next(State.SESSION_CONNECTED)
    }

    openSession(sessionSubject) {
        this.sessionSubject = sessionSubject;
        this.sessionSubject.subscribe(msg => {

            if (msg.type === 'KEY') {

                // console.log('DEBUG received key ' + msg.key);
                this.key = msg.key;

            } else if (msg.type === 'CHANNEL_READY') {

                // console.log('DEBUG channel is ready');
                // replay with the same channel ready
                this.sessionSubject.next(msg);

            } else if (msg.type === 'STATE_DATA') {

                console.log(`DEBUG data state received ${msg.data}`);
                this.data = JSON.parse(msg.data);
            }
        },
        err => console.log(err),
        () => {
            setTimeout(() => window.location.reload(), 3000);
            this.remoteSessionStateSubject.next(State.SESSION_CLOSED);
            console.log('INFO remote session ended')
        });

        /*
          we send the hello to start protocol
         */
        this.sessionSubject.next('hello');
    }
}

export const AppState = React.createContext(new State());
export default AppState;