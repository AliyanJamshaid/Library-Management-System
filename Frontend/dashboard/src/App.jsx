import './App.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';


import Dashboard from './Components/dashboard.jsx'; 
function App() {
  return (
    <Router>
      <Routes>
        <Route path="/dashboard" element={<Dashboard/>} />
      </Routes>
    </Router>
  )
}

export default App;
