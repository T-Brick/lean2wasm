import Lake
open Lake DSL

package lean2wasm {
  -- add package configuration options here
}

lean_lib Lean2Wasm {
  -- add library configuration options here
}

@[default_target]
lean_exe lean2wasm {
  root := `Lean2Wasm
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.4.0-rc1"

lean_exe test where
  root := `Test

script js do
  let out ← IO.Process.output {
    stdin  := .piped
    stdout := .piped
    stderr := .piped
    cmd    := "node"
    args   := #[ ".lake/build/wasm/main.js"]
  }
  IO.print out.stdout
  return out.exitCode
