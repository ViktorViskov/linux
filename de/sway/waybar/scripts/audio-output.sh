#!/bin/bash

get_default() {
    pactl get-default-sink
}

get_sinks() {
    pactl list short sinks | awk '{print $2}'
}

get_description() {
    local sink="$1"

    pactl list sinks | awk -v target="$sink" '
        $0 ~ "Name: " target {found=1}
        found && /Description:/ {
            sub(/^[ \t]*Description: /, "")
            print
            exit
        }
    '
}

case "$1" in
    status)
    current="$(get_default)"

    info="$(pactl list sinks | awk -v target="$current" '
        $0 ~ "Name: " target {found=1}
        found && /Description:/ {
            desc=$0
        }
        found && /Active Port:/ {
            port=$0
            print desc "|" port
            exit
        }
    ')"

    info_lower="$(echo "$info" | tr '[:upper:]' '[:lower:]')"

    if [[ "$info_lower" == *"headphone"* ]] || [[ "$info_lower" == *"headset"* ]]; then
        echo ""
    elif [[ "$info_lower" == *"bluetooth"* ]] || [[ "$current" == bluez_* ]]; then
        echo ""
    else
        echo ""
    fi
    ;;
    next)
        mapfile -t sinks < <(get_sinks)

        current="$(get_default)"
        count="${#sinks[@]}"

        for i in "${!sinks[@]}"; do
            if [[ "${sinks[$i]}" == "$current" ]]; then
                next=$(( (i + 1) % count ))
                new_sink="${sinks[$next]}"

                pactl set-default-sink "$new_sink"

                # Move currently playing streams to the new output
                while read -r input; do
                    pactl move-sink-input "$input" "$new_sink"
                done < <(pactl list short sink-inputs | awk '{print $1}')

                break
            fi
        done
        ;;
esac
