# 💸 은행 서비스 GreenBank
<img width="1454" alt="스크린샷 2024-04-02 15 25 58" src="https://github.com/Junyeoke/bankproject/assets/126323071/6f4e51fa-8232-44ff-aa7a-28662f4c28dc">


<br>

## 🏫 프로젝트 소개

이 프로젝트는 토이 프로젝트로 제작한 프로젝트이며 은행 입금, 출금 기능과 OAuth 2.0을 이용한 소셜로그인 기능을 구현하였습니다.


<br>

## 📆 개발기간/일정관리
1) 개발기간
- 2024.02.12 ~ 2024.02.16 (5일)


<br>

## 🔧 개발환경
- 개발 툴 : Spring Tools 4 (4.21.1)
- Backend : JAVA 17, SpringBoot 3.1.8, MyBatis, JSP, MySQL 8.0.26, lombok, Apache Tomcat : 10.1.19
- Frontend : bootstrap : 4.6.2, HTML5, CSS3, JavaScript : 1.16.1, JQuery : 3.6.4
- 버전/이슈관리 : GitHub, GitBash
- 외부 API : 네이버, 카카오 소셜로그인

<br>

## 📱 브랜치 전략
Git-flow 전략을 기반으로 main, develop 브랜치와 feature 보조 브랜치를 운용했습니다.
- main, develop, Feat 브랜치로 나누어 개발을 하였습니다.
- main 브랜치는 배포 단계에서만 사용하는 브랜치입니다.
- develop 브랜치는 개발 단계에서 git-flow의 master 역할을 하는 브랜치입니다.
- Feat 브랜치는 기능 단위로 독립적인 개발 환경을 위하여 사용하고 merge 후 각 브랜치를 삭제해주었습니다.

<br>

## ⚙ 의존성
```java
dependencies {
	// *********** 추가한 디펜던시 *********** //
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	// implementation 'javax.servlet:jstl' 사용 안됨
    implementation group: 'org.glassfish.web', name: 'jakarta.servlet.jsp.jstl', version: '2.0.0'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.0'
	implementation 'org.springframework.boot:spring-boot-starter-validation'
	// ************************************** //
	
	runtimeOnly 'com.mysql:mysql-connector-j'

	implementation 'org.springframework.boot:spring-boot-starter-web'
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.h2database:h2'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	
	// 암호화 
	implementation 'org.springframework.security:spring-security-crypto'
}
```
<br>

## 1️⃣ 프로젝트 구조

<details>
    <summary>⚡️ 구조 자세히 살펴보기</summary>
    
        📦bankproject
         ┃ ┣ 📂main
         ┃ ┃ ┣ 📂com
         ┃ ┃ ┃ ┗ 📂tenco
         ┃ ┃ ┃ ┃ ┗ 📂bank
         ┃ ┃ ┃ ┃ ┃ ┣ 📂config
         ┃ ┃ ┃ ┃ ┃ ┣ 📂controller
         ┃ ┃ ┃ ┃ ┃ ┣ 📂dto
         ┃ ┃ ┃ ┃ ┃ ┣ 📂handler
         ┃ ┃ ┃ ┃ ┃ ┣ 📂repository
         ┃ ┃ ┃ ┃ ┃ ┣ 📂service
         ┃ ┃ ┃ ┃ ┃ ┣ 📂utils
         ┃ ┃ ┣ 📂db
         ┃ ┃ ┣ 📂mapper
         ┃ ┃ ┣ 📂static
 
    
</details>
    
<br>

## 2️⃣ 프로젝트 개요
본 프로젝트는 은행업무에 사용되는 계좌 생성, 조회, 입출금 기능이 들어간 간단한 토이프로젝트 입니다.

<br>

## 3️⃣ 둘러보기
|메인화면|로그인|회원가입|
|------|------|------|
|![image](https://github.com/Junyeoke/bankproject/assets/126323071/71e08551-759e-411b-af6c-006406b10fbd)|![image](https://github.com/Junyeoke/bankproject/assets/126323071/add9ffb9-ae99-4927-9e01-5c2af9ad4c17)|![image](https://github.com/Junyeoke/bankproject/assets/126323071/a871aa27-7031-445f-8ed8-3a39035943c0)|
|부트스트랩 템플릿을 이용한 디자인 구현|카카오, 네이버 소셜로그인|사진업로드|

|계좌개설|계좌 목록|
|------|------|
|![image](https://github.com/Junyeoke/bankproject/assets/126323071/d4dd4e51-56c2-40cf-9b8d-a9a641a4bb0a)|![image](https://github.com/Junyeoke/bankproject/assets/126323071/1a25277c-02f8-485b-8d49-ea6a9f3cd740)|

|출금|입금|이체하기|
|------|------|------|
|![image](https://github.com/Junyeoke/bankproject/assets/126323071/bfe6c6b1-be88-4991-97da-3e6414b5219c)|![image](https://github.com/Junyeoke/bankproject/assets/126323071/b427a9ca-e57c-4c71-9c5c-45dfba79ece7)|![image](https://github.com/Junyeoke/bankproject/assets/126323071/95735c36-ac6d-48f2-a4f4-043f0f873329)|



