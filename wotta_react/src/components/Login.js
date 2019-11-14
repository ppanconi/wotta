import React, {Component} from 'react';
import AppState from "../state/State";
import {Grid, Header, Transition} from "semantic-ui-react";
import QRCode from "qrcode.react";

class Login extends Component {
    render() {
        return <Grid textAlign='center' style={{height: "100vh"}} verticalAlign='middle'>
            <Grid.Column style={{maxWidth: 220}}>
                <Header as='h3' color='teal' textAlign='center'>
                    Log-in by your phone
                </Header>
                <Transition transitionOnMount={true} animation='scale' duration={500}>
                    <QRCode value={this.context.qrCodeValue}
                            size={200}
                            level={"Q"}
                            renderAs={"svg"}/>
                </Transition>
            </Grid.Column>
        </Grid>;
    }
}

Login.contextType = AppState;
export default Login;