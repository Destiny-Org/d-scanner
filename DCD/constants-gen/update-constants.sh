#!/bin/sh
cp ../../../destiny_engine/spec/pragma.ddd pragma.dd  # from the sibling destiny_engine checkout
cp ../../../destiny_engine/spec/traits.ddd traits.dd  # from the sibling destiny_engine checkout
rdmd generator.d
