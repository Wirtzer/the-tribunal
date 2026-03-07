#!/bin/bash
# Install persona-review skill into OpenClaw and Claude Code

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
OPENCLAW_SKILLS="$HOME/.openclaw/skills"
CLAUDE_SKILLS="$HOME/.claude/skills"

echo "Installing persona-review skill..."
echo "Source: $SCRIPT_DIR"

# OpenClaw
if [ -d "$HOME/.openclaw" ]; then
  mkdir -p "$OPENCLAW_SKILLS"
  ln -sfn "$SCRIPT_DIR" "$OPENCLAW_SKILLS/persona-review"
  echo "Linked to OpenClaw: $OPENCLAW_SKILLS/persona-review"
else
  echo "Skipped OpenClaw (directory not found at ~/.openclaw)"
fi

# Claude Code
if [ -d "$HOME/.claude" ]; then
  mkdir -p "$CLAUDE_SKILLS"
  ln -sfn "$SCRIPT_DIR" "$CLAUDE_SKILLS/persona-review"
  echo "Linked to Claude Code: $CLAUDE_SKILLS/persona-review"
else
  echo "Skipped Claude Code (directory not found at ~/.claude)"
fi

echo "Done. Invoke with /persona-review or ask for a 'panel review'."
