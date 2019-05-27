import React from 'react';
import Users from './containers/Users'
import Events from './containers/Events'
import Navbar from './containers/Navbar'
import './App.css';

function App() {
  return (
    <div className="App">
      <Navbar />
     <Events />
    </div>
  );
}

export default App;
