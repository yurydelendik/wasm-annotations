
# Prereq's

See https://github.com/WebAssembly/binaryen/pull/347 and https://gist.github.com/yurydelendik/a37b786dae40736ed7a1b04770f9c9ed
for annotated WAST

See https://gist.github.com/yurydelendik/6619394d4a47d8448170d429dd74ca99 for SM
wasm and text representation/map

# Making annotated WAST file from call.c

    $LLVM_BIN/clang -emit-llvm --target=wasm32 -Oz calls.c -c -g -o calls.bc
    $LLVM_BIN/llc -asm-verbose=true -o calls.s calls.bc
    $BINARYEN_BIN/s2wasm calls.s --debug-info >calls.wast

# Making SpiderMonker wasm and text representation/map

    $JSSHELL makecallswasm.js > calls.wasm.txt
