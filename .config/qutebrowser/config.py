# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

c.url.start_pages = ['https://www.messenger.com/', 'https://mail.google.com/mail/u/0/#inbox']


c.url.searchengines = {'DEFAULT': 'https://www.google.cz/search?q={}'}
config.bind('<ctrl-shift-i>', 'inspector')
# pissthrough mode more intuitive q
config.bind('<esc>', 'enter-mode passthrough')
config.bind('<ctrl-i>', 'enter-mode passthrough')
config.bind('<ctrl-shift-i>', 'leave-mode', mode='passthrough')
# make it the sensible order
config.bind('H', 'tab-prev')
config.bind('L', 'tab-next')
config.bind('J', 'scroll-page 0 0.5')
config.bind('K', 'scroll-page 0 -0.5')
config.bind('D', 'spawn --userscript qute-lastpass')
config.bind('<ctrl-p>', 'spawn --userscript qute-lastpass')
config.bind('<ctrl-h>', 'back')
config.bind('<ctrl-l>', 'forward')
config.unbind('d')
# additionally clear downloads after each escape press -- they're annoying
# todo: maybe just not show them in fullscreen mode
config.bind('<escape>', 'clear-keychain ;; search ;; fullscreen --leave ;; download-clear')
# hide bars like in zathura; TODO: tabs seem to take one additional press to _start_ toggling, finger dat out
config.bind('<ctrl-n>', 'config-cycle statusbar.hide')
config.bind('<ctrl-m>', 'config-cycle tabs.show always switching')
# [cz keyboard specific] -- more accessible :
# TODO: maybe re*map* ů to : in relevant modes
config.bind('ú', 'set-cmd-text /')
config.bind('ů', 'set-cmd-text :')
# stop permissions requests from popping up on gmail
config.set('content.register_protocol_handler',True,'https://*.gmail.com/*')
config.set('content.register_protocol_handler',True,'https://mail.google.com/*')
config.set('content.dns_prefetch',False)
config.bind('dr', 'download-open st -e ranger')# TODO: generalise terminal

# command mode bindings

config.bind('<ctrl-n>', 'completion-item-focus --history next', mode='command')
config.bind('<ctrl-p>', 'completion-item-focus --history prev', mode='command')

# cycle prompt options reasonably fast
config.bind('<shift-tab>', 'prompt-item-focus prev', mode='prompt')
config.bind('<tab>', 'prompt-item-focus next', mode='prompt')
## allow pdf.js to view pdf files in the browser. note that the files can
## still be downloaded by clicking the download button in the pdf.js
## viewer.
## type: bool
c.content.pdfjs = True
