### Count LOC of git by user and date range
git log  --pretty=tformat: --numstat --author="huynguyennovem@gmail.com" --since="2021-11-01" | gawk '{ add += $1; subs += $2; loc += $1 + $2 } END { printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, loc }' -
