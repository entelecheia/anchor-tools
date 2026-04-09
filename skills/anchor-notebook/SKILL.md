---
name: anchor-notebook
description: >
  Google NotebookLM을 Claude Code에서 직접 연동. 소스 기반 인용 답변, 노트북 라이브러리 관리,
  Studio 산출물 9종(오디오, 마인드맵, 보고서, 퀴즈, 슬라이드 등). notebooklm-skill 기반.
  트리거: NotebookLM, 문서 Q&A, 자료 분석, 문서 요약, 노트북, 자료 종합
---

# anchor-notebook — NotebookLM 연동 리서치

## 역할

Google NotebookLM에 업로드한 문서에서 소스 기반 인용 답변을 Claude Code로 직접 가져오는 스킬.
[notebooklm-skill](https://github.com/PleasePrompto/notebooklm-skill) (5,500+ stars) 기반.

## 핵심 장점

- **Hallucination 대폭 감소**: 업로드 문서에서만 답변 (소스 인용 포함)
- **Studio 산출물 9종**: 오디오 요약, 마인드맵, 보고서, 퀴즈, 슬라이드, 인포그래픽, 플래시카드, 데이터 테이블, 영상
- **자동 후속 질문**: 답변 분석 → 부족한 부분 자동 추가 질문
- **영구 인증**: 최초 1회 Google 로그인 → 이후 자동 세션 유지

## 사전 요구사항

- notebooklm-skill 설치 (install.sh에 포함)
- Google 계정 (NotebookLM 접근용)
- 최초 1회 브라우저 인증 (자동으로 열림)

## 설치

```bash
# anchor-tools install.sh에 포함됨. 수동 설치 시:
cd ~/.claude/skills
git clone https://github.com/PleasePrompto/notebooklm-skill.git notebooklm
cd notebooklm
python scripts/run.py auth_manager.py setup   # 브라우저에서 Google 로그인
```

> run.py 래퍼가 .venv 생성, 의존성 설치, Chromium 설치를 자동 처리.

## 핵심 명령어

### 인증 관리

```bash
python scripts/run.py auth_manager.py status   # 인증 상태 확인
python scripts/run.py auth_manager.py setup    # 최초 설정 (브라우저 열림)
python scripts/run.py auth_manager.py reauth   # 재인증
```

### 노트북 라이브러리 관리

```bash
# 노트북 등록 (Smart Add: 먼저 내용 조회 후 자동 태깅)
python scripts/run.py ask_question.py \
  --question "이 노트북의 내용과 주제를 간략히 요약해줘" \
  --notebook-url "https://notebooklm.google.com/notebook/..."

# 조회 결과로 등록
python scripts/run.py notebook_manager.py add \
  --url "https://notebooklm.google.com/notebook/..." \
  --name "RISE 2차년도 사업계획" \
  --description "2026 앵커 사업 보고서, 예산 집행, 성과지표" \
  --topics "RISE,예산,성과,2026"

# 목록 조회
python scripts/run.py notebook_manager.py list

# 검색
python scripts/run.py notebook_manager.py search --query "예산"

# 활성 노트북 설정
python scripts/run.py notebook_manager.py activate --id notebook-id
```

### 질문하기 (소스 기반 인용 답변)

```bash
# 활성 노트북에 질문
python scripts/run.py ask_question.py --question "2차년도 주요 KPI와 목표치는?"

# 특정 노트북에 질문
python scripts/run.py ask_question.py \
  --question "예산 집행률 현황을 분석해줘" \
  --notebook-id rise-2026

# URL로 직접 질문
python scripts/run.py ask_question.py \
  --question "핵심 결정사항 3가지를 정리해줘" \
  --notebook-url "https://notebooklm.google.com/notebook/..."

# 디버깅 (브라우저 표시)
python scripts/run.py ask_question.py --question "..." --show-browser
```

## 자동 후속 질문 메커니즘

NotebookLM 답변 수신 후 Claude가 자동으로:
1. 답변 분석 → 원래 질문 대비 부족한 정보 식별
2. 부족한 부분에 대해 자동 후속 질문 실행
3. 정보가 충분할 때까지 반복
4. 전체 답변 종합하여 사용자에게 제공

## 앵커 사업단 활용 시나리오

| 시나리오 | 워크플로 |
|----------|---------|
| **사업 보고서 준비** | 1차년도 실적 + 2차년도 계획 업로드 → 교차 분석·핵심 요약 |
| **위원회 자료 준비** | 관련 공문·회의록 등록 → 쟁점 정리·FAQ 자동 생성 |
| **직원 교육** | 사업 매뉴얼·규정 등록 → Studio에서 퀴즈·플래시카드 생성 |
| **홍보 자료** | 성과 데이터 등록 → Studio에서 인포그래픽·슬라이드 생성 |
| **팟캐스트 브리핑** | 주간 보고 문서 → Studio 오디오 요약 생성 → 이동 중 청취 |

## HWP 문서 연동

HWP 파일은 NotebookLM에 직접 업로드 불가. 사전 변환 필요:

```bash
# 1. HWP → PDF 변환 (NotebookLM은 PDF 지원)
hwp convert document.hwp --to pdf -o document.pdf

# 2. PDF를 NotebookLM에 업로드
# 3. Claude에서 notebooklm-skill로 질문
```

또는 Google Drive에 업로드 후 NotebookLM에서 Drive 연결.

## Claude Desktop Projects와 병행

| 구분 | Claude Desktop Projects | NotebookLM |
|------|------------------------|------------|
| 강점 | 실시간 대화, 코드 생성, 유연한 출력 | 소스 인용, Studio 9종, hallucination 감소 |
| 약점 | 인용 출처 불명확, Studio 없음 | 코드 생성 불가, 형식 제한 |
| 적합 | 보고서 초안, 데이터 분석, 번역 | 리서치, 교육 자료, 팩트체크 |

> **권장**: 두 도구 병행. NotebookLM으로 팩트 확인 → Claude로 최종 문서 작성.

## 데이터 저장 위치

```
~/.claude/skills/notebooklm/data/
├── library.json       — 노트북 메타데이터
├── auth_info.json     — 인증 상태
└── browser_state/     — 브라우저 쿠키/세션
```

> .gitignore로 보호됨. 개인정보 포함 — 절대 git 커밋 금지.

## 주의사항

- 반드시 `python scripts/run.py` 래퍼로 실행 (직접 스크립트 호출 금지)
- 최초 인증 시 브라우저가 보여야 함 (headless 불가)
- NotebookLM 무료 계정: 노트북당 소스 50개, 소스당 500,000 단어 제한
- 개인정보 포함 문서 업로드 시 Google 정책 확인 필요
- references/notebook-workflow.md에서 상세 워크플로 확인
