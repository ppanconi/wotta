import React, {Component} from 'react';
import AppState from "../state/State";
import SubjectProvider from "../state/SubjectProvider";
import  { List } from 'semantic-ui-react';

function WorkoutItems(props) {
    const works = props.workouts;
    const listItems = works.map((w) =>

        <List.Item key={w.id}>
            <List.Header>{w.title}</List.Header>{w.notes}
        </List.Item>
    );

    return <List bulleted>{listItems}</List>;
}

class Workouts extends Component {
    render() {
        return (
            <div>
                <SubjectProvider subject={this.context.dataSubject} subjectName='dataSubject'
                                 initialValue={{workouts:[]}}>
                    { ({data}) =>  (
                        <WorkoutItems workouts={data.workouts}/>
                    )}
                </SubjectProvider>
                
            </div>
        );
    }
}
Workouts.contextType = AppState;
export default Workouts;