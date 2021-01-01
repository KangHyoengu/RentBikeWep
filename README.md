# RentBikeWep

개인 웹 프로젝트입니다.<br>
따릉이 api를 사용하여 따릉이 대여정보를 확인할 수 있는 웹 페이지 입니다.

개발 기간<br>
(2020.12.13 ~ 2021.01.01)

사용 기술<br>
Spring framework, Spring-security, maven, Java-Mail, HTML, CSS, Javascript, jQuery, Oracle, MyBatis

통합 개발 환경<br>
Eclipse

사용 프로그램<br>
Sqldeveloper, Sourcetree

사용 API<br>
서울특별시 공공자전거 실시간 대여정보<br>
Google MAP API

상세설명
- 메인페이지: 이 웹이 어떤 웹페이지인지 간단하게 설명하는 페이지이며 각 페이지로 이동할 수 있다.
- 대여하기: Google MAP API와 공공자전거 API를 사용하여 장소를 검색하면 검색한 장소의 대여정보를 지도상에 위치와 함께 보여준다.
- 시설수리신청: 고장난 자전거를 입력 형식에 맞게 입력하고 제출하면 수리신청을 할 수 있다.
- 자유게시판: 자유롭게 의견을 공유할 수 있는 공간이며, Restful api를 적극 활용했다. 
- 회원가입: 정해진 입력 형식에 맞게 입력하고 아이디 중복체크를 하면 회원가입을 할 수 있다. 그리고 비밀번호는 sha-1 알고리즘을 사용하여 DB에 저장한다.
- 로그인: Spring-security를 사용하여 보안성이 높은 로그인을 할 수 있다.
- 비밀번호 찾기: 아이디와 이메일을 입력한 뒤 DB에 저장된 아이디와 이메일이 일치하는지 확인한 후 일치하면 해당 이메일로 Java-Mail을 사용하여 이메일을 보내 인증번호를 확인하고 획인되면 비밀번호를 바꿀수 있게 한다.
- 관리자 시설수리신청: 사용자가 신청한 시설수리신청을 확인하고 수리가 완료된 자전거는 수리완료버튼을 눌러 완료되었다고 표시할 수 있다.
- 관리자 회원 관리: 관리자가 회원정보를 확인, 수정, 삭제할 수 있다.
