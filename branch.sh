#!/bin/sh
function cmt_nova() {
    echo "$1" . "$2"
    git pull 
    git submodule update 
    cd "$1" 
    git checkout "$2" 
    git pull 
    cd .. 
    cd .. 
    git commit . -m "update "$1"." 
    git push
}
function cmt_submodule() {
    git pull 
    git submodule update 
    cd "$1" 
    git checkout "$2" 
    git pull 
    cd .. 
    git commit . -m "update "$1"." 
    git push
}
function branch() {
    cd ~/Desktop/gitlab
    cd nova
    git checkout $1
    cmt_nova frontend/nova-lib $1
    cmt_nova frontend/nova-admin $1 cd ..
    cd mst_state_source
    git checkout $1
    cmt_submodule nova $1 & cd ..
    cd mst-admin-front
    git checkout $1
    cmt_submodule nova $1
    cmt_submodule static $1
}
branch feature-20190328-share
# alias branch='function cmt_nova() {echo "$1" . "$2";git pull && git submodule update && cd "$1" && git checkout "$2" && git pull && cd .. && cd .. && git commit . -m "update "$1"." && git push};function cmt_submodule() {git pull && git submodule update && cd "$1" && git checkout "$2" && git pull && cd .. && git commit . -m "update "$1"." && git push};function branch() {cd ~/Desktop/gitlab && cd nova && git checkout $1 && cmt_nova frontend/nova-lib $1 && cmt_nova frontend/nova-admin $1 cd .. && cd mst_state_source && git checkout $1 && cmt_submodule nova $1 & cd .. && cd mst-admin-front && git checkout $1 && cmt_submodule nova $1 && cmt_submodule static $1};branch'

