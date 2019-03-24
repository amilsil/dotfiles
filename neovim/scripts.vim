function! Cover()
  call inputsave()
  let name = input('Project: ')
  call inputrestore()
  call VimuxRunCommand('lerna run test:coverage --stream --scope=@pb/' . name)
endfunction

function! Test()
  call inputsave()
  let name = input('Project: ')
  call inputrestore()
  call VimuxRunCommand('lerna run test --stream --scope=@pb/' . name)
endfunction

function! Story()
  call inputsave()
  let name = input('Project: ')
  call inputrestore()
  call VimuxRunCommand('lerna run storybook --stream --scope=@pb/' . name)
endfunction

:command! -nargs=0 Story call Story()
:command! -nargs=0 Cover call Cover()
:command! -nargs=0 Test call Test()
