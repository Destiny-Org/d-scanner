# d-scanner: Destiny changes

Destiny's fork of D-Scanner. serve-destiny uses it as a path dependency
(`../d-scanner`), so it is built with the Destiny compiler.

- `dub.json` is restored (it had been removed), so dub and serve-destiny can
  build this checkout directly.
- `src/dscanner/analysis/nolint.d`: the delegate passed to `Poppable` is
  `@trusted`. Under Destiny's always-on scope checking the lambda that calls
  `this.pop(other)` is inferred `@system` (it uses `this` from a struct
  method), and `Poppable` takes a `@safe` delegate. `pop` itself only updates
  the analyser's own stack, so marking the call `@trusted` is sound.

Build it with Destiny's dub:

```
DFLAGS="-revert=safedefault -lowmem" dub build --compiler=destiny
```
