// src/pages/MainPage.jsx
import React from 'react';
import { useNavigate } from 'react-router-dom';

const MainPage = () => {
	const navigate = useNavigate();

	return (
		<div>
<<<<<<< HEAD
			<h1>Graduo 시스템에 오신 것을 환영합니다</h1>
=======
			<div className='title'>
				<h3>아주대학교 소프트웨어학과 졸업요건 충족 확인 사이트</h3>
				<h1>Graduo</h1>
			</div>
>>>>>>> ljh8450
			<button onClick={() => navigate('/login')}>로그인 하러 가기</button>
		</div>
	);
};

export default MainPage;
