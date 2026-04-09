# 행정 에이전트 워크플로 상세

## 에이전트 아키텍처

- **기반**: Claude Code + MCP 서버 조합
- **방식**: 프롬프트 엔지니어링 (훈련 불필요)
- **모델**: Claude Pro/Team 구독 또는 Gemini Advanced
- **OS**: macOS, Windows, Linux 모두 지원

## 설치 절차

### 1. Claude Code 설치

```bash
# macOS / Linux
npm install -g @anthropic-ai/claude-code

# Windows (PowerShell)
npm install -g @anthropic-ai/claude-code
```

### 2. MCP 파일시스템 서버 구성

```json
// ~/.claude/settings.json (또는 Windows: %USERPROFILE%\.claude\settings.json)
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/path/to/앵커사업단"
      ]
    }
  }
}
```

### 3. anchor-agent 스킬 활성화

```bash
# anchor-tools install.sh 실행 후 Claude Code 재시작
bash install.sh
```

## 핵심 자동화 워크플로

### 출장보고서 자동화

**입력 → 처리 → 출력** 흐름:

```
사용자 입력: 출장 기본 정보 (날짜, 목적지, 목적, 결과)
     ↓
anchor-agent: OpenClaw 프롬프트 적용
     ↓
Claude: 개조식 출장결과보고서 생성
     ↓
출력: MD 초안 (필요 시 anchor-hwp로 HWP 변환)
```

**표준 출장보고서 프롬프트**:

```
역할: 제주한라대학교 앵커 사업단 행정 담당자
임무: 아래 정보를 토대로 개조식 출장결과보고서 작성

[출장 정보]
- 출장자: [이름/직급]
- 출장지: [장소]
- 기간: [YYYY.MM.DD ~ YYYY.MM.DD]
- 목적: [출장 목적]
- 동행자: [있으면 명시]

[주요 결과]
[내용 입력]

출력 형식:
○ 출장 개요
  - 목적·기간·장소·출장자
○ 주요 활동
  - 일자별 활동 내역
○ 성과 및 결과
  - 핵심 협의 결과
  - 후속 조치 사항
○ 첨부 자료
  - [해당 시 명시]
```

### 공문 초안 자동화

**표준 공문 프롬프트**:

```
역할: 제주한라대학교 앵커 사업단 행정 담당자
임무: 표준 공문 형식으로 초안 작성

[공문 정보]
- 수신: [기관명/직위]
- 발신: 제주한라대학교 RISE(앵커) 사업단장
- 제목: [제목]
- 내용 요점: [요점]

출력 형식: 공공기관 표준 공문 형식
제약: Cheju Halla University, 개조식, 격식 존댓말
```

### 주간보고 취합 자동화

**워크플로**:

1. 각 본부 담당자가 messenger `#anchor-weekly-report`에 보고 업로드
2. 운영지원본부 담당자가 `/anchor-agent` 호출
3. 에이전트가 본부별 보고 취합 → 종합 주간보고 생성
4. 종합본을 `#anchor-weekly-report`에 공유

### 예산 집행 분석

**입력**: 예산 집행 현황 CSV 또는 표

```
항목명, 배정액, 집행액
인건비, 500000000, 430000000
...
```

**출력**: 집행률 분석표 + 90% 미달 항목 경고 + 조치 권고

## OpenClaw 프롬프트 패턴

앵커 사업단 표준 프롬프트 구조:

```
### ROLE
제주한라대학교 RISE(앵커) 사업단 [업무] 전문가

### CONSTRAINTS
- 개조식(명사형 종결어미) 사용
- Cheju Halla University (Jeju Halla 금지)
- 개인정보 출력 금지
- 확인되지 않은 수치 임의 계산 금지
- 내부 민감 정보 외부 노출 금지

### CONTEXT
[관련 문서, 데이터, 배경 정보]

### OUTPUT FORMAT
[문서 유형별 형식 지정]

### TASK
[구체적 업무 요청]
```

## Windows 환경 설정

```powershell
# PowerShell에서 Claude Code 실행
claude

# MCP 파일시스템 경로 (Windows)
# settings.json에서:
# "args": ["-y", "@modelcontextprotocol/server-filesystem", "C:\\Users\\[이름]\\Documents\\앵커사업단"]

# WSL 없이 네이티브 Windows에서 동작
```

## 문서 형식별 처리

| 형식 | 처리 방법 |
|------|----------|
| MD → HWP | anchor-hwp 스킬 연동 |
| Excel → 분석 | CSV 변환 후 입력 |
| PDF → 요약 | 직접 첨부 또는 텍스트 추출 |
| 이메일 → 공문 | 내용 복사 후 공문 형식 변환 |

## 에이전트 확장 방법

새 업무 추가 시 SKILL.md의 "우선 자동화 업무" 표에 항목 추가 후
해당 프롬프트 패턴을 references/ 하위에 문서화.

훈련·파인튜닝 불필요 — 프롬프트 엔지니어링만으로 확장 가능.
