# 앵커 사업단 Slack 채널 구조

## 워크스페이스 정보

- **워크스페이스명**: 앵커 사업단 (Anchor Project)
- **URL**: anchor-chu.slack.com
- **가입**: 운영지원본부에 이메일(`rise-admin@chu.ac.kr`) 요청

---

## 채널 구조

### 전체 (All Members)

| 채널 | 설명 | 대상 |
|------|------|------|
| `#anchor-general` | 전체 공지, 주요 일정, 사업단 소식 | 전체 |
| `#anchor-random` | 자유 대화, 일상 공유 | 전체 |
| `#anchor-ai-tips` | AI 도구 활용 팁, 유용한 프롬프트 공유 | 전체 |
| `#anchor-ai-help` | AI 사용 중 질문·문제 해결 | 전체 |
| `#anchor-workshop` | 워크숍·세미나·교육 안내 및 후기 | 전체 |

### 사업본부 (Divisions)

| 채널 | 설명 | 대상 |
|------|------|------|
| `#anchor-operations` | 운영지원본부 업무 공유 | 운영지원본부 |
| `#anchor-div1-core` | 핵심인재양성본부 (AI 융합전공, 트랙 운영) | 1-1본부 |
| `#anchor-div2-overseas` | 해외인재본부 (Study Jeju, 국제협력) | 1-2본부 |
| `#anchor-div3-learn` | 런케이션본부 (Flagship, Scale-up) | 2-1본부 |
| `#anchor-div4-rnd` | 연구개발본부 (과제, 논문, 특허) | 2-2본부 |
| `#anchor-div5-elc` | 지역상생본부 (창업, 평생교육, 늘봄) | 2-3본부 |

### 위원회 (Committees)

| 채널 | 설명 | 대상 |
|------|------|------|
| `#anchor-cm-ops` | 운영위원회 (분기 회의, 의결 사항) | 위원회 구성원 |
| `#anchor-cm-project` | 사업추진위원회 | 위원회 구성원 |
| `#anchor-cm-eval` | 자체평가위원회 (KPI 점검, 성과 평가) | 위원회 구성원 |
| `#anchor-cm-planning` | 기획위원회 (연간 계획, 정책 논의) | 위원회 구성원 |

### 업무 (Operations)

| 채널 | 설명 | 대상 |
|------|------|------|
| `#anchor-budget` | 예산 집행 현황, 집행 촉진 알림 | 예산 담당자, 본부장 |
| `#anchor-weekly-report` | 주간업무보고 제출 채널 | 전체 |
| `#anchor-meeting-notes` | 회의록 공유 (회의 후 24시간 내 업로드) | 전체 |

---

## 채널 이용 규칙

### 공통 규칙

1. **채널 목적 준수**: 관련 없는 내용은 `#anchor-random`에 게시
2. **스레드 활용**: 답변은 반드시 스레드(Thread)로
3. **멘션 최소화**: `@channel`, `@here`는 긴급 상황에만
4. **파일 업로드**: 중요 문서는 Google Drive 링크 공유 (Slack 직접 업로드 지양)
5. **보안**: 개인정보, 미공개 예산 데이터 게시 금지

### `#anchor-general` 게시 기준

- 전체 구성원이 알아야 하는 공지만 게시
- 행사 일정, 교육부 방문, 중요 마감일
- 본부별 소식은 해당 본부 채널에 먼저 게시 후 필요시 공유

### `#anchor-ai-tips` 활용 팁

- 유용한 프롬프트 발견 시 공유
- Claude 스킬 사용 사례 및 결과물 공유
- 형식: `[스킬명] 활용 사례: [간단 설명] + 스크린샷`

### `#anchor-weekly-report` 제출 방식

- 매주 금요일 오후 5시까지 제출
- 형식: `templates/weekly-report-form.md` 참조
- 제목 형식: `[본부명] 주간보고 - YYYY년 제NN주`

### `#anchor-meeting-notes` 업로드 방식

- 회의 종료 후 24시간 이내 업로드
- 제목 형식: `[YYMMDD] [회의유형] - [핵심주제]`
- 회의록 파일은 Google Drive에 원본 저장 후 링크 공유

---

## 알림 설정 권장

| 채널 | 알림 권장 설정 |
|------|--------------|
| `#anchor-general` | 모든 메시지 알림 |
| `#anchor-ai-tips` | 멘션만 알림 |
| `#anchor-budget` | 모든 메시지 (담당자), 멘션만 (나머지) |
| 소속 본부 채널 | 모든 메시지 알림 |
| 그 외 채널 | 멘션만 알림 |

---

## 채널 신설 절차

1. `#anchor-operations`에 채널 신설 요청 게시
2. 운영지원본부 검토 (3일 이내)
3. 승인 후 채널 생성 및 공지
