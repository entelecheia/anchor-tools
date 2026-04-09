---
name: anchor-filing
description: >
  파일 라우팅 스킬. 메신저/이메일 수신 파일을 프로젝트별 폴더로 자동 분류.
  트리거: 파일 분류, 폴더 정리, 라우팅, 파일 어디에, 자동 분류
---

# anchor-filing — 파일 라우팅 스킬

## 역할

메신저(Slack/Flow) 또는 이메일로 수신된 파일을 발신자·키워드·파일 유형 기준으로
앵커 사업단 프로젝트별 폴더에 자동 분류.

## 사용 방법

```
/anchor-filing
"이 파일들을 분류해줘: [파일명 목록 또는 파일 첨부]"
```

또는

```
/anchor-filing
"[발신자]: [파일명] 어디에 넣어야 해?"
```

## 분류 기준

references/filing-rules.md 참조.

### 빠른 분류 규칙

| 발신자/키워드 | 대상 폴더 |
|--------------|----------|
| 교육부 공문 | `admin/official-docs/` |
| 회의록, 미팅노트 | `meetings/YYYY/YYYY-MM/` |
| 예산, 정산, 집행 | `admin/budget/` |
| 출장보고서 | `admin/trips/YYMMDD-destination/` |
| RFP, 제안서 | `projects/rise/planning/` |
| 협약서, MOU | `collabs/[파트너명]/` |
| 주간보고 | `admin/weekly-reports/YYYY/` |
| AWS, 아마존 | `collabs/aws/` |
| Saltlux, 솔트룩스 | `collabs/saltlux/` |
| Pix4D | `collabs/pix4d/` |
| 성과지표, KPI | `admin/kpi/` |

## 출력 형식

```
파일: [파일명]
분류: [대상 폴더 경로]
근거: [분류 기준]
---
파일: [파일명]
분류: [대상 폴더 경로]
근거: [분류 기준]
```

## 배치 분류

여러 파일을 한번에 처리:

```
/anchor-filing
다음 파일 목록을 분류해줘:
- 260403_교육부_공문_앵커2차년도.pdf
- 260401_회의록_운영위원회.md
- AWS_협약서_2026.pdf
- 예산집행현황_2026Q1.xlsx
- STAI2026_행사계획서.pptx
```

## 주의사항

- 분류 제안은 참고용. 최종 배치는 담당자 확인 후 실행
- 개인정보 포함 파일은 별도 보안 폴더로 분류
- 상세 규칙: references/filing-rules.md
