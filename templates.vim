" vim-templates
let g:templates_directory = ['~/vimfiles/templates']
let g:license = 'Copyright Cristián Donoso C.'
let g:email = 'cristiandonosoc@gmail.com'
let g:user = 'Cristian'
let g:templates_user_variables = [
      \  ['HEADER_GUARD', 'GetHeaderGuard'],
      \  ['NAME', 'GetName'],
      \  ['MY_LICENSE', 'GetLicense'],
      \]

function! GetName()
  return 'Cristián Donoso C.'
endfunction

function! GetLicense()
  return strftime('%Y') . ' Cristián Donoso C. - All Rights Reserved.'
endfunction

function! GetHeaderGuard()
  let p = expand('%')
python3 << endpython
import vim
import os

# Separate the drive (because windows)
filepath = vim.eval('p')
drive, path = os.path.splitdrive(filepath)
path, filename = os.path.split(path)
dirs = []

# Separate directories up to a level
count = 10
while count > 0:
  path, last_dir = os.path.split(path)
  if not last_dir:
    break
  dirs.insert(0, last_dir)
  count -= 1

# We filter out the directories and uppercase them
filtered_pieces = [p.upper() for p in dirs if p]
filtered_pieces += [p.upper() for p in filename.split('.') if p]

header_guard = '_'.join(filtered_pieces)
vim.command("let header_guard = '%s'" % header_guard)
endpython

return header_guard

endfunction
