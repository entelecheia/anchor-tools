# Anchor AI Workspace Tools (앵커 AI 업무 도구)

[![GitHub stars](https://img.shields.io/github/stars/entelecheia/anchor-tools?style=flat-square)](https://github.com/entelecheia/anchor-tools/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

제주한라대학교 RISE(앵커) 사업단 구성원을 위한 AI 업무 도구 통합 저장소.  
Claude Code 스킬, Claude 데스크톱 프로젝트, 공유 룰북, Slack 가이드, 문서 템플릿을 한곳에 제공합니다.

---

## 빠른 시작

```bash
curl -fsSL https://raw.githubusercontent.com/entelecheia/anchor-tools/main/install.sh | bash
```

설치 후 Claude Code를 재시작하면 `anchor-*` 스킬이 자동으로 활성화됩니다.

---

## 구성 요소

### 1. 스킬 팩 (`skills/`)

Claude Code에서 `/anchor-*` 명령으로 호출하는 전용 스킬 모음.

| 스킬 | 설명 |
|------|------|
| `anchor-report` | 개조식 보고서 변환 (명사형 종결, 불필요 수식어 제거) |
| `anchor-budget` | 예산 집행률 계산 및 요약 테이블 생성 |
| `anchor-minutes` | 회의 녹취/노트 → 정형화된 회의록 변환 |
| `anchor-kpi` | 성과지표 수집 및 대시보드 HTML 생성 |
| `anchor-translate` | 한영 번역 (RISE 용어 일관성 유지) |
| `anchor-onboarding` | 신규 직원 환경 셋업 안내 |

### 2. Claude 데스크톱 프로젝트 (`projects/`)

Claude.ai 데스크톱 앱의 "Projects" 탭에 등록할 시스템 프롬프트 모음.

| 프로젝트 | 용도 |
|---------|------|
| `anchor-report-writer` | 공문·보고서 초안 작성 |
| `anchor-budget-analyzer` | 예산서 분석 및 집행률 검토 |
| `anchor-letter-writer` | 공문서·협조문 작성 |
| `anchor-minutes-organizer` | 회의록 정리 |
| `anchor-kpi-helper` | KPI 현황 정리 및 보고 |
| `anchor-translator` | 한영·영한 번역 |

### 3. 공유 룰북 (`rulebook/`)

모든 Claude 작업에 공통 적용되는 규칙.  
`install.sh` 실행 시 프로젝트 루트에 `CLAUDE.md`로 복사됩니다.

### 4. Slack 가이드 (`slack/`)

채널 구조 및 커뮤니케이션 문화 가이드.

### 5. 문서 템플릿 (`templates/`)

보고서, 회의록, 주간보고 마크다운 템플릿.

### 6. 정책 문서 (`docs/`)

AI 사용 정책, FAQ.

---

## 요구사항

- macOS 12 이상 또는 Ubuntu 22.04 이상
- Node.js 18 이상
- Claude Code (`npm install -g @anthropic-ai/claude-code`)

---

## 설치 상세

```bash
# 1. 저장소 클론 (선택)
git clone https://github.com/entelecheia/anchor-tools.git
cd anchor-tools

# 2. 설치 스크립트 실행
bash install.sh

# 3. Claude Code 재시작 후 스킬 확인
# /anchor-report, /anchor-budget 등 사용 가능
```

---

## 기여

이 저장소는 앵커 사업단 내부용입니다.  
버그 리포트나 개선 제안은 Issues 탭을 이용해 주세요.

---

## 라이선스

MIT License © 2026 Cheju Halla University RISE (Anchor) Project
