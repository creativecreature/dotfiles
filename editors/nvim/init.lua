local cmd = vim.cmd

cmd [[
	let g:loaded_ruby_provider = 0
]]

cmd [[
if exists('g:loaded_tracker_client')
	finish
endif

let g:loaded_tracker_client = 1
let g:tracker_session_id = system(["uuidgen"])

function! s:RequireTrackerClient(host) abort
	return jobstart(['tracker-client'], {'rpc': v:true})
endfunction

call remote#host#Register('tracker-client', 'x', function('s:RequireTrackerClient'))

call remote#host#RegisterPlugin('tracker-client', '0', [
			\ {'type': 'function', 'name': 'OnFocusGained', 'sync': 1, 'opts': {}},
			\ {'type': 'function', 'name': 'OpenFile', 'sync': 1, 'opts': {}},
			\ {'type': 'function', 'name': 'SendHeartbeat', 'sync': 1, 'opts': {}},
			\ {'type': 'function', 'name': 'EndSession', 'sync': 1, 'opts': {}},
			\ ])


autocmd FocusGained * :call call("OnFocusGained", [g:tracker_session_id, expand('%:p')])

autocmd BufEnter * :call call("OpenFile", [g:tracker_session_id, expand('%:p')])

" We are sending a heartbeart each time we write a buffer. This lets the
" server know that our session is still active.
autocmd BufWrite * :call call("SendHeartbeat", [g:tracker_session_id, expand('%:p')])

" When we exit VIM we inform the tracker-server that our coding session has ended.
autocmd VimLeave * :call call("EndSession", [g:tracker_session_id])
]]

require('settings')
require('plugins')
require('keybindings')
require('autocommands')
