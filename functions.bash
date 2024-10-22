expand() {
    src_file="$1"
    dst_file="$2"
    sed -e "s%@@conf_name@@%${conf_name}%g" \
        -e "s%@@conf_location@@%${conf_location}%g" \
        -e "s%@@conf_year@@%${conf_year}%g" \
        -e "s%@@ws_name@@%${ws_name}%g" \
        -e "s%@@ws_author@@%${ws_author}%g" \
        -e "s%@@ws_date@@%${ws_date}%g" \
        -e "s%@@ws_title@@%${ws_title}%g" \
        -e "s%@@document_name@@%${document_name}%g" \
        -e "s%@@gh_repo@@%${gh_repo}%g" \
        -e "s%@@gh_repo_short@@%${gh_repo_short}%g" \
        -e "s%@@matrix_room@@%${matrix_room}%g" \
        -e "s%@@matrix_room_short@@%${matrix_room_short}%g" \
        < "${src_file}" > "${dst_file}"
}
