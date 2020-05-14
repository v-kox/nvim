let g:startify_session_dir = '~/.config/nvim/sessions'

let g:startify_lists = [
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]

let g:startify_bookmarks = [
            \ { 'analysis': '~/Documents/tpvision-analysis'},
            \ { 'smartv-reporting': '~/Documents/smarttv-reporting' },
            \ { 'airflow': '~/Documents/airflow' },
            \ '~/.config/nvim/init.vim',
            \ ]

let g:startify_custom_header = [
            \ '  _   _        __      _______ __  __ ',
            \ ' | \ | |       \ \    / /_   _|  \/  |',
            \ ' |  \| | ___  __\ \  / /  | | | \  / |',
            \ ' | . ` |/ _ \/ _ \ \/ /   | | | |\/| |',
            \ ' | |\  |  __/ (_) \  /   _| |_| |  | |',
            \ ' |_| \_|\___|\___/ \/   |_____|_|  |_|',
            \ '                                      ',
            \ '                                      ',
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0 " Get rid of empty buffers
