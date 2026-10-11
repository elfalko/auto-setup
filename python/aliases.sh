#!/bin/bash

alias pvenv="python3 -m venv venv; [ -f requirements.txt ] && pip3 install -r requirements.txt"
alias penv="source *env/bin/activate"

alias pdepsi="pip3 install pydeps"
alias pdeps="pydeps --no-show --include-missing --max-module-depth 6 --rankdir RL --show-deps -o /tmp/$(basename $(pwd)).html ."
