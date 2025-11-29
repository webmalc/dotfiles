#!/bin/bash
PROMT="As a senior engineer, review this PR/GIT diff. Check for Bugs/security, Best practices, Performance, Architecture(SOLID, DRY, KISS, etc), Suggestions. Ignor anomalous line numbers in diffs. Provide response in structured Markdown syntax. GIT diff: "
echo $PROMT | git diff --cached -U1000000000000000 | ollama run qwen3:30b-a3b-q4_K_M | sed -n '/done thinking./,$p' | glow
