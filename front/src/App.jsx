// src/App.jsx
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import MainPage from './pages/MainPage';
import LoginPage from './pages/LoginPage';
import UploadPage from './pages/UploadPage';
import ResultPage from './pages/ResultPage';

function App() {
	return (
		<Router>
			<Routes>
				<Route path="/" element={<MainPage />} />
				<Route path="/login" element={<LoginPage />} />
				<Route path="/upload" element={<UploadPage />} />
				<Route path="/result" element={<ResultPage />} />
			</Routes>
		</Router>
	);
}

<<<<<<< HEAD
export default App;
=======
export default App;
>>>>>>> ljh8450
