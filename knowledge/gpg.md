# GPG Usage

Add --batch if you don't know the passphrase right now. You will need it
for signing actual images, though.

## GPG in CI pipelines

GPG is notoriously annoying to configure in a headless environment. How this
is done has changed historically, between versions. Using gpg 2.2.19, you can
import keys without being nagged about a passphrase using `--batch`:

    gpg --batch --import "${key}"

Signing (or verifying) using a previously imported key can also be done:

    gpg --batch \
        --pinentry-mode loopback --passphrase-file "${passphrase file}" \
        --local-user "${keyid}" --sign "${file}"

## GPG with the same user on multiple terminals

If you're working remotely, you might find that gpg displays the pinentry query
on the wrong display/tty. In that case it might be necessary to configure
the gpg agent to properly query for a passphrase in the terminal you're using
right now.

Do do so, edit `~/.gnupg/gpg-agent.conf` and add the line

    pinentry-program /usr/bin/pinentry-curses

Then set properly:

    export GPG_TTY=$(tty)

You may even want to add this line to your .bashrc (or whatever shell you're
using, see `man gpg-agent`).
You can test your configuration using:

    echo | gpg --local-user KEY --armor --sign -

This also has the nice side effect of caching that passphrase for the next
10 minutes (for the default configuration).

