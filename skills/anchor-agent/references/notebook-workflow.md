# NotebookLM 연동 워크플로 상세

## notebooklm-skill 개요

- **출처**: [PleasePrompto/notebooklm-skill](https://github.com/PleasePrompto/notebooklm-skill) (5,500+ stars)
- **원리**: Patchright(Playwright 기반) 브라우저 자동화로 NotebookLM 웹 UI에 접근
- **인증**: Google 계정 쿠키 영구 저장 → 최초 1회만 수동 로그인

## 설치 절차

### 1. 스킬 설치

```bash
# 방법 A: claude skill install (권장)
claude skill install PleasePrompto/notebooklm-skill

# 방법 B: 수동 clone
cd ~/.claude/skills
git clone https://github.com/PleasePrompto/notebooklm-skill.git notebooklm
```

### 2. 최초 인증

```bash
cd ~/.claude/skills/notebooklm
python scripts/run.py auth_manager.py setup
```

- Chromium 브라우저 자동 열림
- Google 계정으로 수동 로그인
- 인증 완료 후 브라우저 자동 종료
- `~/.claude/skills/notebooklm/data/auth_info.json`에 상태 저장

## 핵심 명령어

### 인증

```bash
python scripts/run.py auth_manager.py status   # 확인
python scripts/run.py auth_manager.py setup    # 최초 설정
python scripts/run.py auth_manager.py reauth   # 재인증
```

### 노트북 관리

```bash
# Smart Add (내용 조회 후 자동 태깅)
python scripts/run.py ask_question.py \
  --question "이 노트북의 내용과 주제를 요약해줘" \
  --notebook-url "URL"

python scripts/run.py notebook_manager.py add \
  --url "URL" --name "이름" \
  --description "설명" --topics "태그1,태그2"

# 목록/검색/활성화/삭제
python scripts/run.py notebook_manager.py list
python scripts/run.py notebook_manager.py search --query "키워드"
python scripts/run.py notebook_manager.py activate --id ID
python scripts/run.py notebook_manager.py remove --id ID
```

### 질문

```bash
python scripts/run.py ask_question.py --question "질문"
python scripts/run.py ask_question.py --question "질문" --notebook-id ID
python scripts/run.py ask_question.py --question "질문" --notebook-url "URL"
```

## NotebookLM Studio 산출물 9종

NotebookLM 웹 UI에서 생성:

| 산출물 | 앵커 활용 |
|--------|----------|
| 오디오 요약 | 이동 중 사업 브리핑 |
| 마인드맵 | 사업 구조 파악 |
| 보고서 | 위원회 보고 초안 |
| 퀴즈 | 직원 교육 |
| 플래시카드 | 용어 학습, 온보딩 |
| 인포그래픽 | 홍보, 성과 보고 |
| 슬라이드 덱 | 회의 발표 |
| 데이터 테이블 | 비교 분석 |
| 영상 | 대외 홍보 |

## HWP 문서 처리

NotebookLM은 HWP 미지원. 사전 변환 필요:

```bash
# hwp-toolkit으로 PDF 변환 후 업로드
hwp convert document.hwp --to pdf -o document.pdf
```

또는 Google Drive 업로드 후 NotebookLM에서 연결.

## 앵커 노트북 권장 구성

| 노트북 | 문서 | 용도 |
|--------|------|------|
| rise-plans | 사업계획서, RFP, 연차보고서 | 전략 질의 |
| rise-budget | 예산 현황, 정산 규정 | 예산 분석 |
| rise-regulations | 운영 규정, 지침 | 규정 확인 |
| rise-meetings | 월별 회의록 | 결정사항 추적 |
| rise-performance | 성과지표, 자체평가 | KPI 분석 |

## NotebookLM vs Claude Desktop Projects

| 기준 | NotebookLM | Claude Projects |
|------|-----------|----------------|
| 소스 인용 | 정확한 출처 | 불명확 |
| 산출물 | Studio 9종 | 텍스트/코드만 |
| AI 모델 | Gemini | Claude |
| 코드 생성 | 불가 | 가능 |
| 비용 | 무료 | Pro $20/월 |

**권장**: NotebookLM(팩트체크 + Studio) → Claude(초안 + 코드 + HWP 변환) 병행.
