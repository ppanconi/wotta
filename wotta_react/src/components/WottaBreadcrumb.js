import React from 'react';

import {Breadcrumb, Icon} from "semantic-ui-react";
import {Route, Switch} from "react-router-dom";

const WottaBreadcrumb = (props) => {
    return (
        <Switch>
            <Route exact path="/">
                <Icon name='line graph' />
                <Breadcrumb>
                    <Breadcrumb.Section>Results</Breadcrumb.Section>
                    <Breadcrumb.Divider/>
                </Breadcrumb>
            </Route>
            <Route path="/workouts">
                <Icon name='edit outline' />
                <Breadcrumb>
                    <Breadcrumb.Section>Workouts</Breadcrumb.Section>
                    <Breadcrumb.Divider/>
                </Breadcrumb>
            </Route>
            <Route path="/executions">
                <Icon name='cog' />
                <Breadcrumb>
                    <Breadcrumb.Section>Executions</Breadcrumb.Section>
                    <Breadcrumb.Divider/>
                </Breadcrumb>
            </Route>
        </Switch>);
};

export default WottaBreadcrumb;