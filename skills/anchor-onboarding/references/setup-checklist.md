# 앵커 사업단 신규 구성원 셋업 체크리스트

## 1단계: 기본 계정 설정

- [ ] **학교 이메일** (`@chu.ac.kr`) 발급 신청 → IT팀 (it@chu.ac.kr)
- [ ] **GitHub 계정** 생성 또는 연결 (연구원 필수)
  - 조직 초대 요청: 담당 부서장에게 GitHub ID 전달
- [ ] **Google Workspace** 접근 (학교 계정으로 로그인)

---

## 2단계: Slack 워크스페이스 가입

1. 초대 링크로 앵커 Slack 워크스페이스 가입
2. 프로필 설정: 이름(한국어), 소속 본부, 직위, 학교 이메일
3. 필수 채널 가입:
   - `#anchor-general` (전체 공지)
   - `#anchor-ai-tips` (AI 활용 팁)
   - 소속 본부 채널 (`#anchor-div1-core` 등)
4. `#anchor-general`에 자기소개 게시

---

## 3단계: Claude Code 설치

```bash
# Node.js 18+ 확인
node --version

# Claude Code 설치
npm install -g @anthropic-ai/claude-code

# 설치 확인
claude --version
```

Claude.ai 계정 연결 (학교 이메일 또는 개인 계정):
- https://claude.ai 에서 계정 생성
- Claude Code 첫 실행 시 브라우저 인증 진행

---

## 4단계: anchor-tools 설치

```bash
curl -fsSL https://raw.githubusercontent.com/entelecheia/anchor-tools/main/install.sh | bash
```

설치 후 확인:
- [ ] Claude Code 재시작
- [ ] `/anchor-report` 스킬 동작 확인
- [ ] `/anchor-minutes` 스킬 동작 확인

---

## 5단계: Claude 데스크톱 프로젝트 설정

1. Claude 데스크톱 앱 설치: https://claude.ai/download
2. 좌측 사이드바 "Projects" → "New Project"
3. `anchor-tools/projects/` 폴더에서 담당 업무에 맞는 프로젝트 선택
4. `system-prompt.md` 내용을 프로젝트 시스템 프롬프트에 복사
5. 필요한 `knowledge/` 파일을 프로젝트 지식 베이스에 업로드

권장 프로젝트:
- 행정: `anchor-report-writer`, `anchor-minutes-organizer`
- 예산: `anchor-budget-analyzer`
- 연구: `anchor-kpi-helper`

---

## 6단계: 보안 및 정책 숙지

- [ ] `docs/ai-usage-policy.md` 읽기
- [ ] **금지 입력 항목 숙지**:
  - 개인정보 (주민등록번호, 연락처, 주소)
  - 급여·인건비 개인 내역
  - 미공개 예산 계획
  - 개인 면담·평가 내용
- [ ] 개인정보보호 서약서 제출 (행정팀)

---

## 7단계: 업무 도구 접근 권한

역할에 따라 담당자에게 신청:

| 시스템 | 담당 | 연락처 |
|--------|------|--------|
| 학교 ERP (예산) | 행정팀 | admin@chu.ac.kr |
| LMS (강의) | 교학처 | lms@chu.ac.kr |
| 연구 데이터 서버 | IT팀 | it@chu.ac.kr |
| 사업단 내부 Wiki | 운영지원본부 | rise-admin@chu.ac.kr |

---

## 완료 확인

모든 단계 완료 후 운영지원본부(`rise-admin@chu.ac.kr`)에 완료 메일 발송:
- 제목: `[온보딩 완료] 홍길동 / 핵심인재양성본부`
- 내용: 셋업 완료 항목 체크리스트 첨부
