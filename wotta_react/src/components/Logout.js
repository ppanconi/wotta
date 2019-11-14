import React, {Component} from 'react';
import {Dimmer, Header, Icon} from "semantic-ui-react";

class Logout extends Component {
    render() {
        return (
            <Dimmer active={true} inverted page>
                <Header as='h3' icon inverted style={{color:'teal'}}>
                    <Icon name='exclamation triangle' color='grey'/>
                    Remote session closed, you need to login.
                    <Header.Subheader style={{color:'grey'}}>The page will reload in few seconds...</Header.Subheader>
                </Header>
            </Dimmer>)
    }
}

export default Logout;