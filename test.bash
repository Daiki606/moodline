#!/bin/bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2025 Daiki Yamashita
set -eu

out1="$(printf '今日はとても楽しい授業だった\n' | ./moodline)"
echo "Test1: $out1"
echo "$out1" | grep '\[positive\]' > /dev/null

out2="$(printf '今日は最悪な一日だった\n' | ./moodline)"
echo "Test2: $out2"
echo "$out2" | grep '\[negative\]' > /dev/null

out3="$(printf 'ふざけるなよ\n' | ./moodline)"
echo "Test3: $out3"
echo "$out3" | grep '\[angry\]' > /dev/null

if ./moodline 2>stderr.log; then
  echo "Error: moodline should fail when no stdin is provided" >&2
  exit 1
fi

grep 'Usage: echo' stderr.log > /dev/null

echo "All tests passed."
