# HARU

# 개요
	평소 바쁜 생활로 마땅한 취미가 없는 직장인이 주말 등 짧은 휴일간 가까운 위치에서 본인이 관심을 느끼는 취미 활동에 체험해 보는 단기 취미 수업
  
# 구현기능
- 회원가입 ( 계정찾기, 마이페이지) , SNS 로그인
- 원데이 클래스 리스트 (예약률, 1:1 카톡 링크, 오프라인 수강 위치, 강사 프로필, 별점 시스템 )
- 게시판 ( 공지사항, 리뷰 )
- QnA (자주 묻는 질문) 페이지
** 강사
 -  관리 페이지 (원데이 클래스 정보 수정 , 참여자 리스트)
  - 참여자 리스트 ( Excel 또는 PDF 파일 제공 )
 - 정산 시스템 ( 차트  )
** 일반
  - 예약
  - 자동 결제 (문자 발송)
# 사용기술 및 개발환경
	apache tomcat v9.0  //WAS
	Oracle DataBase 11g  //DB
	Google Chart API //구글 차트(그래프)
	KaKao OAuth API //카카오 로그인
	KaKao Map API //카카오 지도
	iTextSharp Library // 참여자 리스트 PDF
	apache POI Library// 참여자 리스트 Excel
	google Gson //Json 포맷 파싱 (카카오 로그인)
	Jsoup Library // XML 포맷 파싱
	Cafe24 SMS API // 문자 발송
	CKEditor // 위지윅 에디터
	Eclipse // IDE
	Bootstrap // 프론트엔드 프레임워크
	HTML,CSS,JavaScript, Java //개발 언어
	JQuery // javascript 라이브러리
