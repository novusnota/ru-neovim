" Сделано, чтобы убрать визуальную
" подстветку ошибок в Markdown
"
" По мнению Vim, _ внутри слов это ошибка
" syn match markdownIgnore "\v\w_\w"
" :syn match markdownIgnore "\$x_i\$"

" Источники:
" https://vi.stackexchange.com/questions/18471/make-vim-stop-highlighting-certain-underscores-in-my-markdown-as-errors
" https://stackoverflow.com/questions/19137601/turn-off-highlighting-a-certain-pattern-in-vim
"
" New error pattern without the underscore
syntax match markdownError "\w\@<=\w\@="
