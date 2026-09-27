#!/usr/bin/env bash
set -euo pipefail

roots=(
    "$HOME/fl"
    "$HOME/dev/projects"
    "$HOME/linux"
)

projects=()

for root in "${roots[@]}"; do
    [[ -d "$root" ]] || continue

    while IFS= read -r -d '' git_marker; do
        projects+=("${git_marker%/.git}")
    done < <(
        find "$root" \
            -mindepth 2 \
            -maxdepth 5 \
            -name .git \
            -print0 2>/dev/null
    )
done

((${#projects[@]} > 0)) || exit 0

# Сортуємо шляхи, щоб список був у сталому порядку.
mapfile -t projects < <(printf '%s\n' "${projects[@]}" | sort -u)

# У меню показуємо лише назви папок.
names=()
for project in "${projects[@]}"; do
    parent="${project%/*}"
    names+=("${parent##*/} / ${project##*/}")
done

index="$(
    printf '%s\n' "${names[@]}" |
        fuzzel --dmenu --index --prompt="Project: "
)"

[[ "$index" =~ ^[0-9]+$ ]] || exit 0
(( index < ${#projects[@]} )) || exit 0

code --ozone-platform=wayland "${projects[index]}"
