import React, {Component} from 'react';
import AppState from "../state/State";
import SubjectProvider from "../state/SubjectProvider";
import { Dimmer, Loader, Segment, Transition, Grid, Header, Image, Message } from 'semantic-ui-react';
import QRCode from 'qrcode.react';

class Main extends Component {
    render() {
        return (
            <div>
                <SubjectProvider subject={this.context.remoteSessionStateSubject}>
                    { ({data}) =>  (
                        <div>
                        {(function(appState) {
                            switch(data) {
                                case 0:
                                    return (
                                        <Segment>
                                            <Dimmer active page inverted>
                                                <Loader>Loading</Loader>
                                            </Dimmer>
                                        </Segment>
                                        )
                                case 5:
                                    return <Grid textAlign='center' style={{ height: '100vh' }} verticalAlign='middle'>
                                        <Grid.Column style={{ maxWidth: 220 }}>
                                            <Header as='h3' color='teal' textAlign='center'>
                                                Log-in by your phone
                                            </Header>
                                            <Transition transitionOnMount={true} animation='scale' duration={500}>
                                                <QRCode value={appState.qrCodeValue}
                                                        size={200}
                                                        level={"Q"}
                                                        renderAs={"svg"}/>
                                            </Transition>
                                        </Grid.Column>
                                    </Grid>
                                case 10:
                                    return <div>{data}</div>
                                case 20:
                                    return <div>Remote session closed...</div>
                                default:
                                    return null;
                            }
                        })(this.context)}
                        </div>


                    )}
                </SubjectProvider>
            </div>
        );
    }
}

Main.contextType = AppState;
export default Main;