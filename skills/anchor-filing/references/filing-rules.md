# 파일 분류 규칙 (Filing Rules)

앵커 사업단 수신 파일의 프로젝트별 폴더 라우팅 기준.

## 분류 알고리즘

우선순위 순서:
1. **발신자** (+3점) — 가장 강력한 분류 신호
2. **파일명 키워드** (+2점) — 제목에 포함된 주제어
3. **파일 유형** (+1점) — 확장자 기반 보조 분류
4. **날짜 패턴** — 연도·분기 기반 하위 폴더 결정

## 발신자별 라우팅

| 발신자 / 도메인 | 대상 폴더 |
|----------------|----------|
| 교육부 (@moe.go.kr) | `admin/official-docs/moe/` |
| 제주도청 (@jeju.go.kr) | `admin/official-docs/jeju/` |
| AWS / 아마존 | `collabs/aws/` |
| Saltlux / 솔트룩스 | `collabs/saltlux/` |
| Pix4D | `collabs/pix4d/` |
| Dassault / 다쏘 | `collabs/dassault/` |
| KAIST | `collabs/kaist/` |
| 내부 (jeju.ai / chu.ac.kr) | 키워드 분류로 위임 |

## 키워드별 라우팅

### 행정 문서

| 키워드 | 대상 폴더 |
|--------|----------|
| 공문, 공식문서, 협조문 | `admin/official-docs/YYYY/` |
| 회의록, 미팅노트, 회의결과 | `meetings/YYYY/YYYY-MM/` |
| 출장보고, 출장결과 | `admin/trips/YYMMDD-[목적지]/` |
| 주간보고, 주간업무 | `admin/weekly-reports/YYYY/` |
| 인사, 채용, 임용 | `admin/hr/` (접근 제한) |

### 예산·재무

| 키워드 | 대상 폴더 |
|--------|----------|
| 예산, 정산, 집행, 이체 | `admin/budget/YYYY/` |
| 구매, 발주, 견적 | `admin/budget/procurement/` |
| 인건비, 급여 | `admin/budget/payroll/` (접근 제한) |

### 사업 기획

| 키워드 | 대상 폴더 |
|--------|----------|
| 사업계획서, 연차보고 | `projects/rise/planning/` |
| RFP, 제안서, 공모 | `projects/rise/planning/rfp/` |
| 성과지표, KPI, 자체평가 | `admin/kpi/YYYY/` |
| 협약서, MOU, 협정 | `collabs/[파트너명]/agreements/` |

### 사업본부별

| 키워드 | 대상 폴더 |
|--------|----------|
| 핵심인재, 융합전공, 트랙 | `divisions/core-talent/` |
| 해외인재, Study Jeju | `divisions/overseas-talent/` |
| 런케이션, Learncation | `divisions/learncation/` |
| R&D, 연구개발, Co-Lab | `divisions/rnd/` |
| 창업, 평생교육, 늘봄 | `divisions/elc-hub/` |

### 이벤트·행사

| 키워드 | 대상 폴더 |
|--------|----------|
| STAI, 컨퍼런스, 포럼 | `events/YYYY/` |
| 워크숍, 세미나, 교육 | `events/YYYY/workshops/` |
| A2CL, 항공우주 | `5g3t-a2cl/` |

## 파일 유형별 보조 규칙

| 확장자 | 처리 방식 |
|--------|----------|
| .hwp, .hwpx | 개요 요약 후 MD 사본 함께 보관 권장 |
| .pdf | 원본 보관, 검색용 텍스트 추출 권장 |
| .xlsx, .csv | 예산/KPI 폴더 우선 배치 |
| .pptx | 발표자료 폴더 (`presentations/`) |
| .mp4, .mov | 행사 영상 폴더 (`events/YYYY/media/`) |
| .md | 관련 프로젝트 폴더에 직접 배치 |

## 개인정보 포함 파일 처리

다음 키워드 포함 시 `admin/confidential/`로 격리 후 담당자 확인:

- 주민등록번호, 생년월일
- 급여, 인건비 개인 내역
- 채용, 면접, 평가 결과
- 징계, 감사 관련

## 폴더 명명 규칙

```
날짜 포함: YYMMDD-[설명]
연도별:    YYYY/
연도-월별: YYYY/YYYY-MM/
```

## 모호한 경우 처리

분류 점수가 동점이거나 확신 불가 시:
1. 후보 폴더 2~3개 제시
2. 근거(발신자/키워드/유형) 점수 표시
3. 담당자 최종 선택 요청

절대 임의 분류 금지 — 불확실하면 반드시 확인 요청.
