---
name: anchor-agent
description: >
  행정 업무 자동화 에이전트. 프롬프트+MCP 기반. 출장보고서, 공문, 예산, 주간보고 자동화.
  트리거: 행정 에이전트, 업무 자동화, 출장보고서, 공문 자동화, agent
---

# anchor-agent — 행정 업무 자동화 에이전트

## 역할

앵커 사업단 행정 업무를 자동화하는 프롬프트+MCP 기반 에이전트.
별도 훈련 없이 Claude/Gemini 구독만으로 즉시 사용 가능.
Windows 환경 완전 호환.

## 핵심 설계 원칙

- **OpenClaw 스타일**: 역할·제약·출력형식 명시 프롬프트 엔지니어링
- **MCP 연동**: 파일시스템·드라이브·이메일 MCP로 문서 자동 입출력
- **구독 기반**: Claude Pro/Team 또는 Gemini Advanced (Saltlux 불필요)
- **무훈련**: 프롬프트 조정만으로 새 업무 추가

## 우선 자동화 업무

| 업무 | 트리거 | 출력 |
|------|--------|------|
| 출장보고서 | "출장보고서 작성해줘" | 개조식 출장결과보고서 (HWP/MD) |
| 공문 초안 | "공문 써줘" | 표준 공문 형식 초안 |
| 예산 집행 | "예산 현황 정리해줘" | 집행률 테이블 + 미집행 항목 분석 |
| 주간보고 수집 | "주간보고 취합해줘" | 본부별 주간보고 종합본 |
| 파일 분류 | "이 파일 어디에 넣어?" | 프로젝트별 폴더 경로 제안 |

## 설치

```bash
# anchor-tools install.sh에 포함됨. 수동 설치:
cd ~/.claude/skills
git clone https://github.com/jeju-ai/anchor-tools.git
# anchor-agent 스킬 자동 활성화 (Claude Code 재시작 후)
```

## 사용 방법

### 출장보고서 자동화

```
/anchor-agent
"다음 정보로 출장보고서 작성해줘:
- 출장지: 서울 교육부
- 기간: 2026.4.3~4.4
- 목적: 앵커 사업 2차년도 협의
- 주요 결과: [내용]"
```

### 공문 초안

```
/anchor-agent
"다음 내용으로 공문 초안 작성해줘:
- 수신: 교육부 지역인재정책과장
- 제목: RISE 2차년도 사업계획 제출
- 내용: [요점]"
```

### 주간보고 취합

```
/anchor-agent
"이번 주 각 본부 주간보고를 취합해서
운영지원본부 종합 주간보고 형식으로 정리해줘"
```

## MCP 연동 구성

```yaml
# MCP 서버 권장 구성 (.claude/settings.json)
mcpServers:
  filesystem:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem", "/Users/[이름]/Documents/앵커사업단"]
  # Microsoft 365 (선택, Windows)
  # Email/Outlook (선택, Windows)
```

## Windows 호환성

- Claude Code for Windows (WSL 불필요)
- PowerShell 또는 CMD에서 실행 가능
- 파일 경로: `C:\Users\[이름]\Documents\앵커사업단\` 형식 지원
- MCP filesystem 서버: Windows 경로 자동 처리

## 프롬프트 엔지니어링 패턴 (OpenClaw)

```
역할: 제주한라대학교 앵커 사업단 행정 전문가
제약:
  - 개조식(명사형 종결) 사용
  - Cheju Halla University 표기
  - 내부 민감 정보 출력 금지
출력 형식: [문서 유형에 따라 지정]
컨텍스트: [관련 문서 또는 데이터 첨부]
요청: [구체적 업무]
```

## 앵커 사업단 활용 시나리오

| 시나리오 | 에이전트 워크플로 |
|----------|----------------|
| 출장 후 보고서 | 출장 메모 입력 → 개조식 보고서 자동 생성 → HWP 변환 |
| 공문 발송 | 수신처·제목·내용 입력 → 표준 공문 초안 → 결재자 검토 |
| 월말 예산 점검 | 집행 내역 CSV 입력 → 집행률 분석 → 미집행 항목 경고 |
| 주간보고 종합 | 각 본부 보고 수집 → 운영지원본부 종합본 자동 생성 |
| 결재 문서 초안 | 안건·근거·결정 사항 입력 → 결재판 형식 문서 생성 |

## 모델 선택

| 모델 | 용도 | 비용 |
|------|------|------|
| Claude Sonnet (기본) | 일반 행정 문서 | Pro $20/월 |
| Claude Opus | 복잡한 분석·전략 문서 | Pro $20/월 |
| Gemini Advanced | 대용량 문서 처리 | Google One AI $20/월 |

> Saltlux AI 구독 불필요. Claude 또는 Gemini 개인/팀 구독으로 충분.

## 주의사항

- 개인정보(주민번호, 급여 내역) 입력 금지
- AI 생성 결과물은 반드시 담당자 검토 후 발송
- 교육부 제출 공식 문서: 부단장 최종 확인 필수
- references/agent-workflow.md에서 상세 워크플로 확인
