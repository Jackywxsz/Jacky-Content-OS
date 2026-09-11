#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
test_root="$(mktemp -d /tmp/jacky-content-test.XXXXXX)"
content_root="$test_root/content-root"

mkdir -p "$content_root"

bash -n \
  "$repo_root/skills/jacky-content/scripts/common.sh" \
  "$repo_root/skills/jacky-content/scripts/init-content-item.sh" \
  "$repo_root/skills/jacky-content/scripts/search-materials.sh"

grep -q '^name: jacky-content$' "$repo_root/skills/jacky-content/SKILL.md"
grep -q 'Jackywxsz/Jacky-Content-OS' "$repo_root/README.md"

if rg -n 'Jacky-OPC|jacky-opc|OPC_ROOT' \
  "$repo_root/README.md" \
  "$repo_root/.env.example" \
  "$repo_root/docs" \
  "$repo_root/skills/jacky-content"; then
  printf 'Legacy OPC references must be removed.\n' >&2
  exit 1
fi

if rg -n -P 'Jackywxsz/Jacky-Content(?!-OS)' \
  "$repo_root/README.md" \
  "$repo_root/docs"; then
  printf 'Stale repository URL found.\n' >&2
  exit 1
fi

JACKY_CONTENT_ROOT="$content_root" \
  bash "$repo_root/skills/jacky-content/scripts/init-content-item.sh" short-video "新变量测试" >/dev/null

test -f "$content_root/04.选题决策/选题管理/待发布的选题/短视频/$(date +%Y.%m.%d)--新变量测试.md"

symlink_target="$content_root/04.选题决策/选题管理/待发布的选题/短视频/$(date +%Y.%m.%d)--符号链接测试.md"
outside_target="$test_root/outside.md"
ln -s "$outside_target" "$symlink_target"
JACKY_CONTENT_ROOT="$content_root" \
  bash "$repo_root/skills/jacky-content/scripts/init-content-item.sh" short-video "符号链接测试" >/dev/null
test -L "$symlink_target"
test ! -e "$outside_target"

printf 'Jacky Content OS release contract checks passed.\n'
