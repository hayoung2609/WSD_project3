# Spring MVC CRUD 게시판 프로젝트

Spring Framework(MVC)와 MariaDB를 활용하여 구축한 웹 게시판 서비스입니다.
기존의 JSP Model 1 방식에서 벗어나 **Spring MVC(Model-View-Controller) 아키텍처**로 리팩토링하였으며, \*\*Spring JDBC(JdbcTemplate)\*\*를 적용하여 데이터베이스 접근 로직을 효율적으로 개선하였습니다.

## 사용 기술 (Tech Stack)

* **Language**: Java 17 (JDK 1.8 호환)
* **Framework**: Spring Framework 5.3.23 (Spring MVC, Spring JDBC)
* **Database**: MariaDB
* **Frontend**: JSP, JSTL, HTML5, CSS3, Bootstrap 5
* **Server**: Apache Tomcat 9.0
* **Build Tool**: Maven

## 주요 기능 (Key Features)

### 1\. Spring MVC 기반 아키텍처

* **DispatcherServlet**: 모든 요청을 중앙에서 처리하고 적절한 컨트롤러로 위임합니다.
* **Controller**: `@Controller`, `@RequestMapping` 어노테이션을 사용하여 URL 요청을 처리합니다.
* **ViewResolver**: 컨트롤러의 처리 결과를 JSP 뷰로 매핑합니다.

### 2\. 게시글 CRUD (기본 기능)

* **Create**: `/board/add` → `/board/addok` (게시글 작성 및 DB 저장)
* **Read**:
    * `/board/list`: 전체 게시글 목록 조회
    * `/board/view/{id}`: 특정 게시글 상세 조회
* **Update**: `/board/editform/{id}` → `/board/editok` (게시글 수정 폼 및 DB 업데이트)
* **Delete**: `/board/deleteok/{id}` (게시글 삭제 및 목록 리다이렉트)

### 3\. 향상된 데이터베이스 처리

* **JdbcTemplate**: Spring JDBC를 사용하여 반복적인 DB 연결/종료 코드를 제거하고 개발 생산성을 높였습니다.
* **DataSource**: `DriverManagerDataSource`를 통해 DB 연결 정보를 빈(Bean)으로 관리합니다.

### 4\. 부가 기능

* **검색 기능**: 제목 또는 작성자 키워드로 게시글을 검색할 수 있습니다 (`keyword` 파라미터 활용).
* **조회수 증가**: 상세 보기 시 조회수 카운트가 증가합니다.

## 🗄️ 데이터베이스 스키마 (Database Schema)

프로젝트 실행을 위한 MariaDB 테이블 생성 SQL입니다.

```sql
CREATE TABLE BOARD (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    content TEXT,
    email VARCHAR(50),
    password VARCHAR(50),
    category VARCHAR(50) DEFAULT '일반',
    regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cnt INT DEFAULT 0,
    filename VARCHAR(200)
);
```

## 실행 화면

![게시판 목록](/img/list.png)
![게시판 상세보기](/img/view.png)
![키워드로 검색](/img/keyword.png)

## 프로젝트 구조 (Directory Structure)

```text
src
├── main
│   ├── java
│   │   └── org.example.springfirstproject
│   │       ├── HomeController.java        // 메인 화면 처리
│   │       └── board
│   │           ├── BoardController.java   // 게시판 URL 요청 처리 (C,R,U,D 제어)
│   │           ├── BoardDAO.java          // JdbcTemplate을 이용한 DB 접근
│   │           └── BoardVO.java           // 데이터 객체 (Getter/Setter)
│   ├── resources
│   │   └── img/                           // 정적 이미지 파일
│   └── webapp
│       └── WEB-INF
│           ├── web.xml                    // 한글 인코딩 필터 및 서블릿 설정
│           ├── dispatcher-servlet.xml     // Spring MVC 설정 (ViewResolver 등)
│           ├── applicationContext.xml     // Spring JDBC(DB) 설정
│           └── views
│               ├── index.jsp              // 메인 페이지
│               ├── header.jsp / footer.jsp // 공통 레이아웃
│               └── board
│                   ├── list.jsp           // 게시글 목록 (검색 UI)
│                   ├── view.jsp           // 상세 보기
│                   ├── write.jsp          // 글 작성 폼
│                   └── edit.jsp           // 글 수정 폼
└── pom.xml                                // Maven 의존성 관리
```

### 개발자

* **Name**: Hayoung Kang
* **Student ID**: 22400011
* **Course**: Web Service Development