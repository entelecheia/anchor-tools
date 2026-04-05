# 자주 묻는 질문 (FAQ)

앵커 AI 업무 도구 사용 중 자주 나오는 질문과 답변 모음.

---

## 설치 및 환경 설정

### Q. Claude Code 설치가 안 됩니다.

**A.** Node.js 버전을 먼저 확인하세요.

```bash
node --version  # 18.0.0 이상이어야 함
```

Node.js가 없거나 버전이 낮으면 https://nodejs.org 에서 LTS 버전 설치 후 재시도.

```bash
npm install -g @anthropic-ai/claude-code
```

설치 후에도 `claude` 명령이 없으면 터미널을 재시작하세요.

---

### Q. `install.sh` 실행 시 권한 오류가 납니다.

**A.** 스크립트에 실행 권한을 부여하세요.

```bash
chmod +x install.sh
bash install.sh
```

`sudo` 없이 실행을 권장합니다. `sudo`가 필요하면 Node.js 설치 경로를 확인하세요.

---

### Q. 스킬이 설치되었는데 Claude Code에서 보이지 않습니다.

**A.** Claude Code를 완전히 종료 후 재시작하세요.  
스킬은 `~/.claude/skills/` 에 설치됩니다. 확인 방법:

```bash
ls ~/.claude/skills/
# anchor-report  anchor-budget  anchor-minutes  anchor-kpi  anchor-translate  anchor-onboarding
```

파일이 없으면 `install.sh`를 다시 실행하세요.

---

### Q. Windows에서 설치가 되나요?

**A.** WSL2 (Ubuntu) 환경에서 사용을 권장합니다.  
Windows Terminal + WSL2 설치 후 Ubuntu 환경에서 동일하게 진행하세요.

---

## 스킬 사용

### Q. `/anchor-report`를 실행했는데 아무 반응이 없습니다.

**A.** 스킬 호출 후 변환할 텍스트를 함께 입력하거나 이어서 입력하세요.

```
/anchor-report
아래 내용을 개조식으로 변환해줘:
"지난 분기에 런케이션 프로그램을 운영하여 총 487명이 참가하였고..."
```

---

### Q. 개조식으로 변환했는데 어색한 표현이 있습니다.

**A.** AI 변환 결과는 반드시 사람이 검토 후 사용하세요.  
어색한 부분을 지적하면 Claude가 수정합니다:

```
"3번째 항목 표현이 어색해. '추진하는 것을 목표로 함' → '추진 목표' 형태로 더 간결하게 바꿔줘"
```

---

### Q. `/anchor-budget`에 어떤 형식으로 데이터를 입력해야 하나요?

**A.** 세 가지 형식 모두 가능합니다.

**자연어:**
```
인건비 배정액 1억 2천만원, 집행액 8천만원
연구활동비 배정액 5천만원, 집행액 2천5백만원
```

**표 형식:**
```
| 과목 | 배정액 | 집행액 |
|------|--------|--------|
| 인건비 | 120,000,000 | 80,000,000 |
```

**CSV:**
```
과목,배정액,집행액
인건비,120000000,80000000
```

---

### Q. 회의록 정리 시 참석자 정보가 없어도 됩니까?

**A.** 없어도 처리 가능합니다. 누락된 항목은 `[확인 필요]`로 표시됩니다.  
회의록 완성도를 높이려면 일시, 장소, 참석자를 포함해 입력하세요.

---

## Claude 데스크톱 프로젝트

### Q. Projects 탭이 Claude 앱에 안 보입니다.

**A.** Claude Pro 이상 구독이 필요합니다.  
사업단에서 제공하는 팀 계정이 있다면 운영지원본부에 문의하세요.

---

### Q. 시스템 프롬프트를 어디에 붙여넣나요?

**A.**
1. Claude 앱 → 좌측 사이드바 → Projects → New Project
2. 프로젝트 이름 입력 (예: "앵커 보고서 작성")
3. "Set instructions" 또는 "Project instructions" 영역에 `system-prompt.md` 내용 붙여넣기
4. "Add knowledge" → `knowledge/` 폴더의 파일 업로드

---

## 보안 및 데이터

### Q. 예산 데이터를 Claude에 입력해도 괜찮나요?

**A.** 총액·집행률 등 집계 수치는 입력 가능합니다.  
다음은 입력하지 마세요:
- 개인별 인건비 상세 내역
- 확정 전 예산안
- 교육부 협상 중인 금액

---

### Q. Claude가 입력한 내용을 학습에 사용합니까?

**A.** Anthropic의 정책에 따라 다릅니다.  
- Claude.ai 무료/Pro: 기본적으로 학습에 활용 가능 (설정에서 끄기 가능)
- Claude Teams/Enterprise: 학습에 미활용
- 민감한 업무 데이터는 Teams 계정 사용 권장

자세한 내용: https://www.anthropic.com/privacy

---

### Q. AI가 생성한 문서를 그대로 제출해도 되나요?

**A.** 반드시 사람이 검토 후 제출하세요.  
AI는 사실 오류(환각)가 있을 수 있고, 수치·날짜 확인은 필수입니다.  
교육부 제출 문서는 담당자 + 부단장 검토 과정을 거쳐야 합니다.

---

## 기타

### Q. 이 저장소에 새 스킬이나 템플릿을 추가하고 싶습니다.

**A.** GitHub Issues에 제안하거나 Pull Request를 제출하세요.  
저장소: https://github.com/entelecheia/anchor-tools

스킬 추가 시 `SKILL.md + references/` 구조를 반드시 준수하세요.

---

### Q. 다른 질문이 있으면 어디에 문의하나요?

**A.**
- Slack: `#anchor-ai-help`
- 이메일: yj.lee@chu.ac.kr
- GitHub Issues: https://github.com/entelecheia/anchor-tools/issues
