# 🥘 음식점 조회 및 리뷰 서비스, SUP 

![banner](./README.assets/banner.png)

## 🥨 프로젝트 목차

- [팀원 소개](https://github.com/svc-proto-dev-internship/UPLUS_SUP/blob/dev/README.md#-%ED%8C%80%EC%9B%90-%EC%86%8C%EA%B0%9C)
- [주요 기능](https://github.com/svc-proto-dev-internship/UPLUS_SUP/blob/dev/README.md#-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD)
- [개발 환경](https://github.com/svc-proto-dev-internship/UPLUS_SUP/blob/dev/README.md#-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD)
- [프로젝트 산출물](https://github.com/svc-proto-dev-internship/UPLUS_SUP/blob/dev/README.md#-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD)

<br>

## 🍰 팀원 소개

| 이름                                    | 역할     | 담당 기능                                            |
| --------------------------------------- | -------- | ---------------------------------------------------- |
| [송유나](https://github.com/YunaSong97) | Frontend | 지도 페이지, 지도 Bottom Sheet, 음식점 검색          |
| [이윤경](https://github.com/yxxnkxx)    | Backend  | 리뷰 API, GitHub Actions, redis 적용                 |
| [이하림](https://github.com/2harim)     | Backend  | 회원, 음식점 조회, 즐겨찾기 API, 배포                |
| [정혜령](https://github.com/lettersto)  | Frontend | 리뷰 상세 페이지, 사진 확대 페이지, 리뷰 작성 페이지 |

<br>

## ☕️ 주요 기능

#### 1. 오늘의 Pick (추천)

- Google Geocoding API 사용해 현재 위도, 경도로 구, 동을 표시

- 1km 내 별점 높은 순으로 5개 추천

<img src="./README.assets/KakaoTalk_Photo_2023-03-21-13-32-36.gif" alt="KakaoTalk_Photo_2023-03-21-13-32-36" style="zoom:30%;" width="200" />

<br>

#### 2. 즐겨찾기

- 즐겨찾기 아이콘을 터치하면 지도에 즐겨찾기 핀 추가/제거

<img src="./README.assets/KakaoTalk_Photo_2023-03-21-13-08-08.gif" alt="KakaoTalk_Photo_2023-03-21-13-08-08" style="zoom:30%;" width="200"  />

<br>

#### 3. Bottom Sheet - 검색

- 키워드 검색 - 최근 검색어 중복 없이 최신 순 정렬, 삭제 가능

<img src="./README.assets/KakaoTalk_Photo_2023-03-21-13-57-13.gif" alt="KakaoTalk_Photo_2023-03-21-13-57-13" style="zoom:30%;" width="200" />

- 태그 검색

<img src="./README.assets/category_search.gif" alt="category_search" style="zoom:30%;" width="200" />

Bottom Sheet - 검색 결과

<br>

#### 4. 리뷰 상세 화면

- 리뷰 Infinite Scroll & Pull to refresh
- 리뷰 검색 기능 & 필터링 기능
- 사진만 모아보는 사진 리뷰 Infinite Scroll
- 리뷰 태그 & 태그별 차트
- 도움 돼요! 버튼
- 리뷰마다 이미지 슬라이드

<img src="./README.assets/review_main.gif" alt="review_main" style="zoom:30%;" width="200" />

<br>

#### 5. 리뷰 - 사진 상세

- 이미지 페이지 슬라이드로 이미지를 넘겨 보는 기능

<img src="./README.assets/photo_detail.gif" alt="photo_detail" style="zoom:30%;" width="200" />

<br>

#### 6. 리뷰 - 리뷰 작성

- 별점, 태그 선택, 사진 추가가 있는 리뷰 작성 기능

<img src="./README.assets/review_form.gif" alt="review_form" style="zoom:30%;" width="200" />

<br>

## 🍮 개발 환경

| 분류             | 환경                                                         |
| ---------------- | ------------------------------------------------------------ |
| Frontend         | Dart, Flutter, Riverpod, Dio, Retrofit, freezed, json_serializable |
| Backend          | Kotlin, Java11, SpringBoot, PostgreSQL, Spring Data JPA, S3, Redis, Kotest, Mockk, dokka |
| 배포             | AWS EC2, GitHub Actions, Docker, Docker Hub                  |
| 서비스           | Google Map API, Kakao Map API, 공공데이터, Geocode, Swagger  |
| IDE              | IntelliJ, Android Studio                                     |
| 일정 & 형상 관리 | Github                                                       |
| 디자인           | Figma                                                        |
| 커뮤니케이션     | Slack, Notion                                                |

<br>

## 🥗 프로젝트 산출물

🍉 [Notion](https://www.notion.so/lettersto/SUP-Search-Ur-Place-2bc2462b73864f21b8feb3644d92c953) 

🍒 [Figma](https://www.figma.com/file/xXjjsZUiRMj1Dx8ysvdtwN/SUP?node-id=0%3A1&t=96zryubxvThEfN11-1)

<br>
