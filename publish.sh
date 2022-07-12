#!/bin/bash

if [ "$#" -ne "1" ]; then
  echo "버전 인자 넣으세요 (ex: ./publish.sh 0.0.1)"
  exit 1
fi

CHANGELOGS=$(cat CHANGELOG.md | tail -n +3)

git checkout inflab \
  && git pull origin inflab --rebase \
  && echo -e "# Changelog\n\n## [$1](https://github.com/inflearn/shaka-player/compare/v$1) ($(date +%Y-%m-%d))\n\n$CHANGELOGS" > CHANGELOG.md \
  && sed -i '' -E "s/'v.+\..+\..+-uncompiled'/'v$1-uncompiled'/g" lib/player.js \
  && sed -i '' -E "s/\"version\": \".+\..+\..+\"/\"version\": \"$1\"/g" package.json \
  && git add . \
  && git commit -m "v$1" \
  && git tag "v$1" \
  && git push origin inflab \
  && git push origin "v$1" \
  && npm publish

