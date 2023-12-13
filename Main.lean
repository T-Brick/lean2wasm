import Mathlib.Data.List.Basic -- requiring mathlib to see if it can be handled
import Std

def using_std_test : Std.HashMap Nat String :=
  Std.HashMap.empty |>.insert 5 "this was compiled into WASM!"

def msg := using_std_test.find! 5

def main (args : List String) : IO UInt32 := do
  IO.println s!"Hello, {msg}!"
  IO.println s!"{args}"

  /- Compiling with and without `-sNODERAWFS` changes behaviour here. With it,
      the current directory should be the directory that the calling shell is
      in but `home/web_user` will not exist (unless you have that directory
      on your system). Without that flag, the current directory should be `/`
      and `/home/web_user` should exist.

      Relevant emscripten docs:
      - https://emscripten.org/docs/porting/files/file_systems_overview.html
      - https://emscripten.org/docs/api_reference/Filesystem-API.html
  -/
  IO.println s!"current directory: {← IO.currentDir}"

  let webuser : System.FilePath := "" / "home" / "web_user"
  if ←(webuser.pathExists) then
    IO.println s!"{webuser} does exist"
  else
    IO.println s!"{webuser} doesn't exist"

  return 0
