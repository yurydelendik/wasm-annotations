function getWasmDebugInfo(wasmBytes) {
  function readUint32() {
    var n = wasmBytes[pos] | (wasmBytes[pos + 1] << 8) |
      (wasmBytes[pos + 2] << 16) | (wasmBytes[pos + 3] << 24);
    pos += 4;
    return n;
  }
  function readVarUint32() {
    var n = 0, shift = 0;
    var b = wasmBytes[pos++];
    while (!!(b & 0x80)) {
      n |= (b & 0x7F) << shift;
      shift += 7;
      b = wasmBytes[pos++];
    }
    return n | (b << shift);
  }
  function readString(len) {
    var ch = wasmBytes.subarray(pos, pos + len);
    pos += len;
    return String.fromCharCode.apply(null, ch);
  }

  var pos = 0;
  if (readUint32() != 0x6d736100) {
    throw new Error('WASM: Invalid magic number');
  }
  if (readUint32() != 10) {
    throw new Error('WASM: Invalid version number');
  }
  var tables = Object.create(null);
  while (pos < wasmBytes.length) {
    var sectionSize = readVarUint32();
    var sectionEnd = pos + sectionSize;
    var id = readString(readVarUint32());
    tables[id] = {start: pos, end: sectionEnd};
    pos = sectionEnd;
  }
  var dbgTablesInfo = tables['_experiment_dbg_tables'];
  var dbgTables = null;
  if (dbgTablesInfo) {
    dbgTables = Object.create(null);
    pos = dbgTablesInfo.start;
    var count = readVarUint32();
    while (count--) {
      var len = readVarUint32();
      var s = String.fromCharCode.apply(null, wasmBytes.subarray(pos, pos + len));
      var m = /^[\w\.]+/.exec(s);
      if (m) {
        dbgTables[m[0]] = s;
      }
      pos += len;
    }
  }
  var functionsInfo = tables['function_bodies'];
  var functions = [];
  pos = functionsInfo.start;
  var count = readVarUint32();
  while (count--) {
    var size = readVarUint32();
    functions.push({start: pos, end: pos + size});
    pos += size;
  }
  return {
    wasm: wasmBytes,
    tables: tables,
    functions: functions,
    dbgTables: dbgTables
  };
}

function getDbgLocation(debugInfo, fnIndex, offset) {
  var codeAnnotations = debugInfo.dbgTables['.code_annotations'];
  var m, re;
  for (var n = fnIndex, re = /\s+\.function\s+([^\n]+)/g, m = re.exec(codeAnnotations);
       m && n; m = re.exec(codeAnnotations)) n--;
  if (!m) return null;
  re = /(\d+|b\([^\)]+\)|loc\([^\)]+\))/g;
  var items = m[1].split(re), i;
  for (i = items.length - 2; i >= 0; i-=2) {
    var ch = items[i][0];
    if (ch >= '0' && ch <= '9' && +items[i] <= offset) {
      break;
    }
  }
  if (i < 0) return null;
  var j = i - 2;
  while (j > 0 && items[j].indexOf('loc(') !== 0) j -= 2;
  if (j < 0) return null;
  var parts = items[j].split(/[\(\)\s]/g);
  var fileIndex = parts[1];
  var line = +parts[2];
  var col = +parts[3];
  m = new RegExp('\\s\\.file\\s' + fileIndex + '\\s([^\\n]+)').exec(codeAnnotations);
  if (!m) return null;
  var filename = JSON.parse(m[1]);
  return {fnName: '$func$' + fnIndex, file: filename, line: line, col: col};
}

