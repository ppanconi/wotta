import React, {Component} from 'react';
import AppState from "../state/State";
import SubjectProvider from "../state/SubjectProvider";
import { Dimmer, Loader, Segment } from 'semantic-ui-react';
import Login from "./Login";
import Layout from "./Layout";
import Logout from "./Logout";

class Main extends Component {
    render() {
        return (
            <div>
                <SubjectProvider subject={this.context.remoteSessionStateSubject}>
                    { ({data: state}) =>  (
                        <div>
                        {(function() {
                            switch(state) {
                                case 0:
                                    return (
                                        <Segment>
                                            <Dimmer active page inverted>
                                                <Loader size='massive' style={{color:'teal'}}>Loading</Loader>
                                            </Dimmer>
                                        </Segment>
                                        )
                                case 5:
                                    return <Login/>
                                case 10:
                                    return <Layout/>
                                case 20:
                                    return <Logout/>
                                default:
                                    return null;
                            }
                        })()}
                        </div>
                    )}
                </SubjectProvider>
            </div>
        );
    }
}

Main.contextType = AppState;
export default Main;