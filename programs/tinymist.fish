#!/usr/bin/env fish
# Dependencies curl, jq, unzip

# TODO: make my own script to not depend on a third party
curl -sSL https://github.com/hongjr03/tinymist-nightly-installer/releases/latest/download/run.sh | bash -s -- binary --stable

