
Drop schema GRADUO;
-- 2. 새로운 스키마 생성

-- 2. 새로운 스키마 생성
CREATE SCHEMA GRADUO;

-- 3. graduation_requirement 테이블
CREATE TABLE GRADUO.graduation_requirement (
    id INT NOT NULL PRIMARY KEY,
    department VARCHAR(50) NULL,
    start_year INT NULL,
    end_year INT NULL,
    total_credit INT NULL CHECK (total_credit > 0),
    major_credit INT NULL CHECK (major_credit > 0),
    basic_credit INT NULL CHECK (basic_credit > 0),
    distribution_area_credit INT NULL CHECK (distribution_area_credit > 0),
    industrial_course_count INT NULL CHECK (industrial_course_count > 0),
    is_dual_degree BOOLEAN DEFAULT FALSE,
    CHECK (
        (is_dual_degree = TRUE AND industrial_course_count = 1) OR
        (is_dual_degree = FALSE AND industrial_course_count = 2)
    )
);

-- 4. graduation_comparative_score 테이블
CREATE TABLE GRADUO.graduation_comparative_score (
    id INT NOT NULL PRIMARY KEY,
    toeic INT NULL CHECK (toeic > 0),
    teps INT NULL CHECK (teps > 0),
    toeic_speaking INT NULL CHECK (toeic_speaking > 0),
    opic INT NULL CHECK (opic > 0),
    topcit INT NULL CHECK (topcit > 0),
    apc INT NULL CHECK (apc > 0),
    FOREIGN KEY (id) REFERENCES GRADUO.graduation_requirement(id)
);

-- 5. user 테이블
CREATE TABLE GRADUO.user (
    user_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NULL,
    student_number VARCHAR(20) UNIQUE,
    department VARCHAR(50) NULL,
    entrance_year INT NULL,
    is_dual_degree BOOLEAN DEFAULT FALSE
);

-- 6. lecture 테이블
CREATE TABLE GRADUO.lecture (
    lecture_id VARCHAR(10) NOT NULL PRIMARY KEY, ###교과목 코드
    name VARCHAR(100) NULL,
    credit INT NULL CHECK (credit > 0),
    code VARCHAR(20) NULL,
    semester VARCHAR(10) NULL,
    lecture_department VARCHAR(50) NULL
);

create TABLE Graduo.change_named_lecture (
    prev_lecture_name VARCHAR(100) NOT NULL primary key,
    current_ VARCHAR(100) NOT NULL
);

-- 7. taken_lecture 테이블
CREATE TABLE GRADUO.taken_lecture (
    id INT NOT NULL PRIMARY KEY,
    user_id INT NOT NULL,
    lecture_id VARCHAR(10) NOT NULL,  -- ✅ 수정됨
    taken_year INT NULL,
    taken_semester VARCHAR(10) NULL,
    score ENUM('A+', 'A0', 'B+', 'B0', 'C+', 'C0', 'P', 'F') NULL,
    FOREIGN KEY (user_id) REFERENCES GRADUO.user(user_id),
    FOREIGN KEY (lecture_id) REFERENCES GRADUO.lecture(lecture_id)
);


-- 8. required_general 테이블
CREATE TABLE GRADUO.required_general (
    lecture_id VARCHAR(10) NOT NULL PRIMARY KEY,
    is_field_required BOOLEAN DEFAULT FALSE,
    subject_field ENUM('역사와 철학', '문학과 예술', '인간과 사회', '자연과 과학', '연결과 통합', 'Others') NULL,
    start_student_num INT NULL CHECK (start_student_num > 0),
    end_student_num INT NULL CHECK (end_student_num > 0),
    FOREIGN KEY (lecture_id) REFERENCES GRADUO.lecture(lecture_id)
);

-- 9. major 테이블
CREATE TABLE GRADUO.major (
    lecture_id VARCHAR(10) NOT NULL PRIMARY KEY,
    is_required BOOLEAN DEFAULT FALSE,
    start_year INT NULL,
    end_year INT NULL,
    is_industry BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (lecture_id) REFERENCES GRADUO.lecture(lecture_id)
);

-- 10. external_score 테이블
CREATE TABLE GRADUO.external_score (
    external_score_id INT NOT NULL PRIMARY KEY,
    user_id INT NOT NULL,
    external_score_type ENUM('TOPCIT', 'APC') NULL,
    eng_score_type ENUM('TOEIC', 'OPIC', 'TEPS') NULL,
    external_score INT NULL CHECK (external_score > 0),
    eng_score INT NULL CHECK (eng_score > 0),
    aquisition_date DATE NULL,
    FOREIGN KEY (user_id) REFERENCES GRADUO.user(user_id)
);
CREATE TABLE GRADUO.raw_lecture_import_2023 (
    num                    INT,
    college                VARCHAR(100),
    department             VARCHAR(100),
    major                  VARCHAR(100),
    subject_name           VARCHAR(200),
    class_number           VARCHAR(20),
    subject_code           VARCHAR(20),
    professor              VARCHAR(100),
    professor_department   VARCHAR(100),
    credit                 INT,
    hours                  INT,
    course_category        VARCHAR(50),
    subject_type           VARCHAR(50),
    is_english             VARCHAR(10),
    english_grade          VARCHAR(10),
    is_foreign_only        VARCHAR(10),
    is_team_teaching       VARCHAR(10),
    lecture_time_label     VARCHAR(200),
    split_type             VARCHAR(50),
    lecture_class          VARCHAR(50),
    teaching_method        VARCHAR(50),
    subject_feature        VARCHAR(100),
    subject_name_eng       VARCHAR(200),
    subject_id             INT,
    target_grade           VARCHAR(20),
    split_class_method     VARCHAR(50),
    split_class_type       VARCHAR(50)
) CHARACTER SET utf8mb4;
