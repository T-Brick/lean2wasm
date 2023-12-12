# Lean2Wasm

Tool to compile Lean4 code to WASM. Right now this is really just for me to test
things out. So actually using it is a little scuffed right now :)

This is largely a translation of [these instructions](https://leanprover.zulipchat.com/#narrow/stream/270676-lean4/topic/wasm.20build/near/402692669)
into something that can be executed.

This requires [emcc](https://emscripten.org/docs/getting_started/downloads.html)
to already be installed.

## Usage

Run `lake build test` to build the test program. Then run `lake build` to build
the utility. Running `lake exe lean2wasm` will compile the `Test` program.

Once compiled, you can run `node .lake/build/wasm/main.js` to run the program.
Alternatively you can use `lake run js`.

If you want to change what is being compiled, in `Lean2Wasm.lean` just change
the `root` variable.
