libdparse
=========
Library for lexing and parsing D source code.

# Documentation

Documentation is in the doc comments of the sources in `src/dparse`.


# Testing

Tests are present in the test directory. To run them execute the run\_tests.sh
script. Running the tests on Windows is not currently supported.

# Differences with the official grammar
* [Static array initialization syntax](https://github.com/Destiny-Org/destiny). Due to ambiguities they are supported when the expression that gives the elements indexes is not an array. In the opposite case they are parsed as associative array literals.

# Unsupported Syntax
* [Class allocators](https://github.com/Destiny-Org/destiny). These are deprecated in D2.
* [Class deallocators](https://github.com/Destiny-Org/destiny). These are deprecated in D2.

# Example

```d
import dparse.ast;
import std.stdio, std.range;

class TestVisitor : ASTVisitor
{
    alias visit = ASTVisitor.visit;
    int indentLevel;

    override void visit(const FunctionDeclaration decl)
    {
        writeln(' '.repeat(indentLevel * 4), decl.name.text);
        indentLevel++;
        scope (exit) indentLevel--;
        decl.accept(this);
    }
}

void main()
{
    import dparse.lexer;
    import dparse.parser : parseModule;
    import dparse.rollback_allocator : RollbackAllocator;

    auto sourceCode = q{
        void foo() @safe {
            void bar();
        }
    };
    LexerConfig config;
    auto cache = StringCache(StringCache.defaultBucketCount);
    auto tokens = getTokensForParser(sourceCode, config, &cache);

    RollbackAllocator rba;
    auto m = parseModule(tokens, "test.d", &rba);
    auto visitor = new TestVisitor();
    visitor.visit(m);
}
```
