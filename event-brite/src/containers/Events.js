import React,{Component} from 'react'
import Axios from 'axios';
class Events extends Component {
    constructor(props){
        super(props)
        this.state = {
            events: []
        }
    }
    getEvents() {
        Axios.get('/api/alpha/events/')
        .then(response => {
            console.log(response)
          this.setState ({
            events: [...response.data]
          })
        })
        .catch(error => console.log(error))
    }

    addEvents(){
        Axios.post('/api/alpha/events/',{event: {title: 'me',date: '2022-08-07 10:01:17',user_id: 40}})
        .then(response => {
            console.log(response)
            this.setState({
                events: [...this.state.events,response.data]
            })
        })
        .catch(error => {
            console.log(error)
  })
    }
    render() {
        let event = this.state.events.map(event => <li key={event.id}>{event.title} {event.date}</li>)
        return(
            <div>
                <button onClick={this.getEvents.bind(this)}>Get Events</button>
                <button onClick={this.addEvents.bind(this)}>Set Events</button>
                <ul>{event}</ul>    
            </div>
        )
    }
}

export default Events