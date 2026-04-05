#!/usr/bin/env bash
# install.sh — 앵커 AI 업무 도구 설치 스크립트
# Usage: bash install.sh  또는  curl -fsSL <url> | bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SKILLS_DEST="$HOME/.claude/skills"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "========================================"
echo " 앵커 AI 업무 도구 설치"
echo " Cheju Halla University RISE (Anchor)"
echo "========================================"
echo ""

# 1. Claude Code 설치 확인
if ! command -v claude &>/dev/null; then
  echo -e "${YELLOW}[INFO] Claude Code가 설치되어 있지 않습니다. 설치를 시작합니다...${NC}"
  if ! command -v npm &>/dev/null; then
    echo -e "${RED}[ERROR] npm이 필요합니다. Node.js 18 이상을 먼저 설치해 주세요.${NC}"
    echo "  https://nodejs.org/"
    exit 1
  fi
  npm install -g @anthropic-ai/claude-code
  echo -e "${GREEN}[OK] Claude Code 설치 완료.${NC}"
else
  echo -e "${GREEN}[OK] Claude Code 감지됨: $(claude --version 2>/dev/null || echo 'installed')${NC}"
fi

# 2. 스킬 디렉토리 생성
if [ ! -d "$SKILLS_DEST" ]; then
  echo -e "${YELLOW}[INFO] ~/.claude/skills/ 디렉토리 생성 중...${NC}"
  mkdir -p "$SKILLS_DEST"
fi

# 3. anchor-* 스킬 복사
echo ""
echo "[INFO] 스킬 복사 중..."
SKILLS_SRC="$REPO_DIR/skills"

if [ ! -d "$SKILLS_SRC" ]; then
  echo -e "${RED}[ERROR] skills/ 디렉토리를 찾을 수 없습니다: $SKILLS_SRC${NC}"
  echo "  저장소 루트에서 실행하고 있는지 확인해 주세요."
  exit 1
fi

for skill_dir in "$SKILLS_SRC"/anchor-*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DEST/$skill_name"
  if [ -d "$dest" ]; then
    echo -e "  ${YELLOW}[UPDATE]${NC} $skill_name"
    rm -rf "$dest"
  else
    echo -e "  ${GREEN}[NEW]${NC}    $skill_name"
  fi
  cp -r "$skill_dir" "$dest"
done

# 4. rulebook/CLAUDE.md 복사 (현재 디렉토리 기준)
RULEBOOK="$REPO_DIR/rulebook/CLAUDE.md"
if [ -f "$RULEBOOK" ]; then
  TARGET_DIR="${PWD}"
  # curl로 실행한 경우 REPO_DIR이 /tmp일 수 있으므로 홈 기준으로 복사
  if [ "$REPO_DIR" = "/tmp" ] || [ "$REPO_DIR" = "/tmp/" ]; then
    TARGET_DIR="$HOME"
  fi
  cp "$RULEBOOK" "$TARGET_DIR/CLAUDE.md"
  echo -e "${GREEN}[OK] rulebook/CLAUDE.md → $TARGET_DIR/CLAUDE.md 복사 완료.${NC}"
fi

# 5. 완료 메시지
echo ""
echo -e "${GREEN}========================================"
echo " 설치 완료!"
echo "========================================${NC}"
echo ""
echo "다음 단계:"
echo "  1. Claude Code를 재시작하세요."
echo "  2. 아래 스킬을 사용할 수 있습니다:"
echo ""
echo "     /anchor-report     — 개조식 보고서 변환"
echo "     /anchor-budget     — 예산 집행률 계산"
echo "     /anchor-minutes    — 회의록 정리"
echo "     /anchor-kpi        — KPI 대시보드 생성"
echo "     /anchor-translate  — 한영 번역 (RISE 용어 일관성)"
echo "     /anchor-onboarding — 신규 직원 환경 셋업"
echo ""
echo "  3. Claude 데스크톱 프로젝트 설정:"
echo "     projects/ 폴더의 system-prompt.md를 Claude.ai Projects에 등록하세요."
echo ""
echo "문의: yj.lee@chu.ac.kr"
echo ""
