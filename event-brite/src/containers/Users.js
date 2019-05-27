import React, { Component } from 'react'
import axios from 'axios'
class Users extends Component {
    constructor(props){
        super(props)
        this.state = {
            users: []
        }
    }
    getUsers() {
        axios.get('/api/alpha/users')
        .then(response => {
          this.setState ({
            users: [...response.data]
          })
        })
        .catch(error => console.log(error))
      }
    handleRemoveUser(e){
     
      this.setState({
        users: [...this.state.users.filter(user=> user.id !== Number(e.target.id))]
      })
      let a = 'api/alpha/users/'
      a += e.target.id
      axios.delete(a)
    }
      componentDidMount() {
        this.getUsers()
    }
  render() {
      const users = this.state.users.map(user => <li id={user.id} key={user.id} onClick={this.handleRemoveUser.bind(this)}>{user.email}</li>)
    return (
      <div>
        <ul>
            {users}
        </ul>
      </div>    
    )
  }
}

export default Users