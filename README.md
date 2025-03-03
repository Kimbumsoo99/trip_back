# 💻 프로젝트 소개

SSAFY 1학기 Back end 수업에서 진행된 관통 프로젝트로, **"국내 관광지 추천"** 서비스를 구현하였습니다.

## 🕐 개발 환경

-   2024.03.22 ~ 2024.03.23
-   JSP / Servlet / MySQL
-   STS

## 📝 Features

### 화면 구성

#### 메인 화면 구성

-   Happy Trip! 프로젝트의 메인 페이지는 다음과 같은 구성으로 나뉘어져 있습니다.

    ![](https://i.ibb.co/BVXWDCJ/main1.png)

    ![](https://i.ibb.co/SywLDc4/main2.png)

    ![](https://i.ibb.co/DkgVzVR/main3.png)

#### 지역별 관광지

-   지역별 관광지 정보에서는 지도를 볼 수 있습니다.
-   지도에서는 `combo box`를 통해 원하는 지역의 정보를 얻을 수 있습니다.

    ![](https://i.ibb.co/fpzGNK1/map2.png)

#### 여행정보공유

-   여행 정보 공유 페이지에서는 자신의 여행 추천 경로를 공유할 수 있는 페이지입니다.

    ![](https://i.ibb.co/y8HhScT/2024-03-23-1-37-15.png)

-   글쓰기 버튼으로 여행 정보를 입력할 수 있습니다

    ![](https://i.ibb.co/fD70vtv/2024-03-23-1-36-41.png)

-   제목 클릭으로 상세보기로 이동할 수 있고 수정, 삭제가 가능합니다

    ![](https://i.ibb.co/4Mzy0Wr/2024-03-23-1-37-03.png)

#### 마이페이지

-   마이페이지는 자신의 설정 정보를 변경하거나 삭제할 수 있습니다.

    ![](https://i.ibb.co/MSwSj4w/2024-03-23-1-33-54.png)

### 로그인 회원가입 기능

-   로그인 기능

![](https://i.ibb.co/DK6kQLW/login.png)

사용자는 회원 가입된 유저 정보라면, 로그인이 가능합니다.

-   회원 가입 기능

![](https://i.ibb.co/9WdYyQ5/sign.png)

## REST API

-   `{root}/trip/sido` / `GET` : DB에 저장된 `sido` 정보 반환, 반환 타입 JSON
-   `{root}/trip/gugun?sidocode={sidoCode}` / `GET` : `sidoCode`(**필수**) 쿼리 파라미터에 해당되는 `gugun` 정보 반환, 반환타입 JSON
-   `{root}/trip/mapping?sidocode={sidoCode}&gugunCode={gugunCode}&type={type}` / `GET`
    -   `sidoCode`, `gugunCode`(**필수**) 쿼리 파라미터에 해당하는 지역 관광 정보 반환
    -   `type`(선택) 쿼리 파라미터에 해당하는 관광 정보 타입 매핑 (입력 X -> 모든 정보 반환)

## 🏃 Members

👨 김범수(팀장)

👨 이중현
