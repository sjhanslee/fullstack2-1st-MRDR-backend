#  :shopping:	모른다르 MRDR

<br/>

## :white_check_mark: 프로젝트 개요

모른다르 프로젝트는 라이프 & 스포츠 의류 쇼핑몰을 구현한 프로젝트로, 이커머스가 가진 기본적인 기능(회원가입, 상품 정보 전달, 장바구니 등)을 구현한 프로젝트입니다.
[안다르](https://andar.co.kr/index.html) 사이트를 학습 목적으로 클론한 사이트입니다.

- 기간 : 2021.10.01 ~ 2021.10.22 (마지막 한 주 - 리팩토링)
- 인원 : 5명
- [프론트엔드 Gitub Repository](https://github.com/wecode-bootcamp-korea/fullstack2-1st-MRDR-frontend)
- [백엔드 Github Repository](https://github.com/wecode-bootcamp-korea/fullstack2-1st-MRDR-backend)

<br/>

## :white_check_mark:	 전체적인 구조

<img src="https://user-images.githubusercontent.com/88504900/137711524-56bc57a5-21ec-4feb-9fea-ec4b8aa3cda5.jpeg" width="90%">

:exclamation: CI / CD 는 구현되지 않아 점선으로 처리하였습니다.

<br/>

## :white_check_mark:	 사용 기술 및 개발 환경

|       분류       |   사용 언어 혹은 기술   |
| :--------------: | :---------------------: |
|       언어       |       **JavaScript**        |
|   런타임 환경    |         **Node.js**         |
| 웹 앱 프레임워크 |         **Express**         |
|   데이터베이스   |          **MySQL**          |
|  ORM 프레임워크  |         **Prisma**          |
|   버전관리 툴    |       **Git, Github**       |
|       IDE        |   **Visual Studio Code**    |
| 커뮤니케이션       | **Slack, Notion**           |
|      그 외       | **ESLint, Prettier, Babel** |

<br/>

## :white_check_mark: 프로젝트 목표 & 주요 관심사

### :grey_exclamation: 공통사항

* **레이어드 패턴**(현재 프로젝트는 네 개의 영역 - Router, Controller, Service, Model)에 맞게 잘 분리하여 해당 영역에 해당 관심사 코드만이 존재하도록 구성합니다.
* **Rest API** 전략을 따른 올바른 주소 형식과 HTTP Status Code에 맞춰 API를 구성합니다.
* **에러 및 예외 처리**를 공통 에러 핸들링 미들웨어로 처리하고, 각 API 별 에러 및 예외가 날 수 있는 많은 경우의 수를 생각하여 처리합니다.

<br/>

### :grey_exclamation: 브랜치 관리 및 PR merge

- Git flow 전략을 간소화하여 **main(master) / feature별 구현 branch** 로 나누어 작업하였습니다.

- feature 구현 branch Naming Convention

   `feature/[type]/[feature-name]`

  - type
    - add : 새로운 기능 추가
    - fix : 기존 기능 혹은 버그 수정
  - feature-name : 해당 기능의 간단한 이름

- 구현해야할 기능을 분리하여 이슈 단위로 분류하여 깃헙 리포지토리에 이슈로 작성하였고, 각 이슈는 해당하는 PR에 연결되며, 각 PR은 feature branch 하나와 연결됩니다.

- PR의 체크 리스트가 완료되고, 두 명 이상에게 Peer Review가 approve 됐을 때만 main에 merge 할 수 있습니다.

<br/>

### :grey_exclamation: DB

* DB 모델링은 최대한 **정규화**하여 중복되는 데이터가 없도록 진행하였습니다.
* Prisma ORM 프레임워크를 사용하나 모델링과 DB 마이그레이션에만 사용하고, DML에 대한 학습 및 이해를 높이기 위해 **Native query**로 진행하였습니다.
* 쿼리문을 최대한 나누지 않고 DB와의 한번의 통신으로 데이터를 조회할 수 있도록 쿼리문을 작성하였습니다.

<br/>

## :white_check_mark:	 Features

### 유저 관련

- 회원가입 : 비밀번호 암호화 포함 (POST)
- 로그인 : 인증 미들웨어, 로직 포함 (POST)

### 상품 관련

- 상품 리스트 조회 : 모든 상품, 카테고리별, 가격순 정렬, 상품 이름 검색 조회 (GET)
- 상품의 이미지 조회 (GET)
- 상품의 색상과 색상별 이미지 조회 (GET)
- 상품의 기본 정보, 옵션, 재고 조회 (GET)

### 장바구니 관련

- 상품 장바구니에 담기 (POST)
- 장바구니 조회 (GET)

<br/>

*자세한 내용은 하단의 API WIKI을 참고 부탁드립니다.🙂*

<br/>

## :white_check_mark:	 API WIKI

[모른다르 백엔드 API WIKI](https://github.com/wecode-bootcamp-korea/fullstack2-1st-MRDR-backend/wiki/%EB%AA%A8%EB%A5%B8%EB%8B%A4%EB%A5%B4-%EB%B0%B1%EC%97%94%EB%93%9C-API-WIKI)

<br/>

## :white_check_mark: DB ERD

<img src="https://user-images.githubusercontent.com/88504900/137736724-b7b66a1d-c73d-4c79-b885-a9a90564dce5.png" width="90%">
