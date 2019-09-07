#!/bin/sh
# TODO: use sed instead of cut
# TODO: paginate output (using template html)

fc-list | cut -d: -f2 | sed -e 's/.*/<strong>\0:<\/strong><p style=\"font-family:\0/' -e 's/$/\"> The quick brown fox jumps over the lazy dog. <\/p>"/' >> /tmp/index.html
