ARG DEV_USER=dev \
  DEV_USER_ID=1000
FROM greyltc/archlinux-aur:paru
ARG DEV_USER DEV_USER_ID
LABEL version="0.1.0" \
    description="Falk's dev container (nvim + lsps + git + tmux + dotfiles)" \
    author="Falk Schoenfeld (falk.fairfield@gmail.com)"

RUN pacman-key --init \
  && paru -Syu --noconfirm archlinux-keyring \
  && aur-install \
    neovim tmux git \
    fzf the_silver_searcher ripgrep \
    less jq wget
# bash dev
RUN aur-install shellcheck shfmt bash-language-server
# nvim dev
RUN aur-install lua-language-server vim-language-server
# python dev
RUN aur-install python3 basedpyright

# setup user
RUN useradd "${DEV_USER}" \
  --shell /bin/bash \
  --user-group --uid ${DEV_USER_ID} \
  --create-home --home-dir "/home/${DEV_USER}" \
  && chmod -R 770 "/home/${DEV_USER}"
USER ${DEV_USER}

# setup workdir
RUN mkdir -p /home/${DEV_USER}/ws
WORKDIR /home/${DEV_USER}/ws

# setup auto-setup
COPY --chown=${DEV_USER}:${DEV_USER} . /home/${DEV_USER}/auto-setup/
RUN mkdir -p /home/${DEV_USER}/.local/share/ \
  && cd /home/${DEV_USER}/auto-setup \
  && . ./setup.sh
