var ar = wasmTextToBinary(read('/Users/yury/llvmwasm/calls.wast'));
os.file.writeTypedArrayToFile('calls.wasm', ar);
print(wasmBinaryToText(ar));