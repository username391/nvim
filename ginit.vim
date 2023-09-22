let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! JetBrainsMono\ NF:h10" . s:fontsize
endfunction

noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a


" set buffer name as window title
set title

" предполагаю, что это не особо нужно
" GuiWindowOpacity 0.97

" inoremap <leader-f> :call GuidWindowFullScreen(1)<CR>

" GuiWindowFullScreen(1)

