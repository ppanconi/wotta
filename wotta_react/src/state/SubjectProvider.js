import {Component} from 'react';

class SubjectProvider extends Component {

    //-1 waiting
    //0 active
    //1 done

    constructor(props){
        super(props);
        this.state = {
            snapshot : {
                data: this.props.initialValue || null,
                connectionState: -1,
                error : null,
            }
        };

        this.subscription = null;
    }

    componentDidMount() {
        this.subscription = this.props.subject.subscribe(
            (data) => {
                this.setState({
                    snapshot:{
                        data: data,
                        connectionState : 0,
                        error : null
                    }
                })
            },
            (error) => {
                this.setState({
                    snapshot:{
                        data: null,
                        connectionState : 1,
                        error : error
                    }
                })
            },
            () => {
                this.setState({
                    snapshot:{
                        data: null,
                        connectionState : 1,
                        error : null
                    }
                })
            }
        );
    }

    componentWillUnmount() {
        this.subscription.unsubscribe();
    }

    render() {
        return (
            this.props.children(this.state.snapshot)
        );
    }
}

export default SubjectProvider;