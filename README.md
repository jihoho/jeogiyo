# 저기요



## 개요

배민, 요기요와 같은 음식 배달 서비스 클론 프로젝트로서 Spring boot, mybatis를 활용하여 개발했습니다.

---



## 주요 관심사

- 설계 부터 UI, 프론트, 백엔드 까지 구현하며 전체적인 웹 개발 경험
- Spring mvc 패턴 적용 및 복습

---



## 개발 환경 및 기술 스택

- java 11
- Spring Boot
- mybatis
- Oracle
- JSP
- Gradle

- Git
- Intellij
- Notion
- Figma

---



## 요구사항

[요구사항](https://www.notion.so/18c3555a10334f459cf099ce299e16f8)

__ __



## 화면 설계

- 요기요, 배민 서비스를 기반으로 디자인
- pigma 디자인 툴을 기반으로 UI 설계
- 피그마를 사용하여 대략적인 프로토타입을 개발할 수 있고, CSS도 뽑아 낼 수 있어 프론트 개발에 매우 용이

![ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled.png](ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled.png)

![ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled%201.png](ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled%201.png)

[피그마 링크](https://www.figma.com/file/1iHcLqAeBK6jzzSPrjSJuP/Jeogiyo?node-id=0%3A1)

---



## ERD

![ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled%202.png](ReadMe%20fb399c6307984ebd8e000c79ebb81e66/Untitled%202.png)

---



## 실행 화면

- 추가 예정

---



## 프로젝트 이슈

[Notion](https://www.notion.so/b41bdb2b0c264afc98ba521facda9d74)

__ __



## 추가 계획

#### 단위 테스트 작성

Right-BICEP 지침을 기반으로 단위 테스트 작성

- B : 경계 조건(Boudary conditions)은 맞는가?
- I : 역 관계(Inverse relationship)를 검사할 수 있는가?
- C : 다른 수단을 활용하여 교차 검사(cross-check)할 수 있는가?
- E : 오류 조건(Error conditions)을 강제로 일어 나게 할 수 있는가?
- P : 성능 조건(Performance chracteristics)은 기준에 부합하는가?



경계 조건 : CORRECT 기억법

- [C]onformance(준수) : 값이 기대한 양식을 준수하고 있는가?
- [O]rdering(순서) : 값의 집합이 적절하게 정렬되거나 정렬되지 않았나?
- [R]ange(범위) : 이성적인 최솟값과 최댓값 안에 있는가?
- [R]eference(참조) : 코드 자체에서 통제할 수 없는 어떤 외부 참조를 포함하고 있는가?
- [E]xistence(존재) : 값이 존재하는가?(non-null,non-zero, 집합에 존재하는가 등)
- [C]ardinality(기수) : 정확히 충분한 값들이 있는가?
- [T]ime(절대적 혹은 상대적 시간) : 모든 것이 순서대로 일어나는가? 정확한 시간에? 정시에?




#### 전체적인 코드 Refactoring

- 객체 지향 설계 원칙 SOLID 기반으로 코드 설계 리팩토링

- 중복되는 코드 제거
- 가독성 높은 네이밍으로 변경
- 컨트롤러 비지니스 로직 최소화

---