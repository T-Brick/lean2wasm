import Mathlib.Data.List.Basic -- requiring mathlib to see if it can be handled
import Std

def test : Std.HashMap Nat String :=
  Std.HashMap.empty |>.insert 5 "this was compiled into WASM!"

def hello := test.find! 5

def main (args : List String) : IO Unit := do
  IO.println s!"Hello, {hello}!"
  IO.println s!"{args}"
