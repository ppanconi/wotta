import React, {Component} from 'react'
import {
    Menu,
    Segment,
    Icon,
    Sidebar,
    Transition
} from 'semantic-ui-react'

import { BrowserRouter as Router,
    Switch,
    Route,
    NavLink } from 'react-router-dom';

import WottaLabel from "./WottaLabel";
import WottaBreadcrumb from "./WottaBreadcrumb";
import Workouts from "./Workouts";

class Layout extends Component {

    state = {
        sideVisible: false,
    }

    sideVisibleHandler = () =>
        this.setState((prevState) => ({ sideVisible: !prevState.sideVisible }))

    render() {
        return (
            <Router>
                <Sidebar.Pushable>
                    <Sidebar
                        as={Menu}
                        animation='push'
                        direction='left'
                        visible={this.state.sideVisible}
                        icon='labeled'
                        vertical
                        width='thin'
                        inverted
                    >
                        <Menu.Item>
                            <WottaLabel/>
                        </Menu.Item>
                        <Menu.Item as={NavLink} to='/' exact color='teal' >
                            <Icon name='line graph' />
                            Results
                        </Menu.Item>
                        <Menu.Item as={NavLink} to='workouts' color='teal'>
                            <Icon name='edit outline' />
                            Edit Workouts
                        </Menu.Item>
                        <Menu.Item as={NavLink} to='executions' color='teal'>
                            <Icon name='cog' />
                            Executions
                        </Menu.Item>
                    </Sidebar>
                    <Menu fixed='top' borderless compact>
                        <Menu.Item
                            name='menu'
                            active={this.state.sideVisible}
                            color='teal'
                            onClick={this.sideVisibleHandler}
                        >
                            <Icon name='bars'/>
                        </Menu.Item>

                        <Transition.Group animation='browse' duration={200}>
                            {! this.state.sideVisible && (
                                <Menu.Item>
                                    <WottaLabel color='teal'/>
                                </Menu.Item>
                            )}
                        </Transition.Group>

                        <Menu.Item>
                            <WottaBreadcrumb/>
                        </Menu.Item>

                    </Menu>
                    <Sidebar.Pusher>
                        <Segment basic className='appcontent'>
                            <Switch>
                                <Route exact path="/">
                                    <h1>Results</h1>
                                </Route>
                                <Route path="/workouts">
                                    <h1>Workouts</h1>
                                    <Workouts/>
                                </Route>
                                <Route path="/executions">
                                    <h1>Executions</h1>
                                </Route>
                            </Switch>
                        </Segment>
                    </Sidebar.Pusher>
                </Sidebar.Pushable>
            </Router>
        );
    }
}

export default Layout