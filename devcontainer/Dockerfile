ARG DEV_USER=dev
FROM greyltc/archlinux-aur:paru
ARG DEV_USER
LABEL version="0.1.0" \
    description="Falk's dev container (nvim + lsps + git + tmux + dotfiles)" \
    author="Falk Schoenfeld (falk.fairfield@gmail.com)"

RUN pacman-key --init \
  && paru -Syu --noconfirm archlinux-keyring \
  && aur-install \
    neovim tmux git \
    fzf the_silver_searcher ripgrep
# bash dev
RUN aur-install shellcheck shfmt bash-language-server
# nvim dev
RUN aur-install lua-language-server vim-language-server
# python dev
# disabled for docker build testing speed
# RUN aur-install python3 basedpyright

# setup user
RUN useradd "${DEV_USER}" \
  --shell /bin/bash \
  --user-group \
  --create-home --home-dir "/home/${DEV_USER}"
USER ${DEV_USER}

# setup workdir
RUN mkdir -p /home/${DEV_USER}/ws
WORKDIR /home/${DEV_USER}/ws

# RUN git clone https://github.com/elfalko/auto-setup.git /home/${DEV_USER}/auto-setup \
#   && cd /home/${DEV_USER}/auto-setup \
#   && . ./setup.sh
