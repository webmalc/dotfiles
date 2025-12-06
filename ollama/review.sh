#!/bin/bash
PROMT="As a senior engineer, review this PR/GIT diff. Check for Bugs/security, Best practices, Performance, Architecture(SOLID, DRY, KISS, etc), Suggestions. Ignore anomalous line numbers in diffs. Provide response in structured Markdown syntax. Dont rewrite code."
# FILENAMES="File changed to review: \n$(git diff --name-only --cached).\n\n"
# CODEBASE=".Codebase: $(~/.cargo/bin/code2prompt -F markdown)"
# echo -e "$PROMT $FILENAMES $CODEBASE" | ollama run qwen3-coder:30b-a3b-q4_K_M | glow
#
CODEBASE=".Codebase: $(git diff --cached -U1000000000)"
echo -e "$PROMT  $CODEBASE" | ollama run qwen3-coder:30b-a3b-q4_K_M | glow
