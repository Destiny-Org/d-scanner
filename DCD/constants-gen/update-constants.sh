#!/bin/sh
cp ../../../destiny_engine/spec/pragma.dd pragma.dd  # from the sibling destiny_engine checkout
cp ../../../destiny_engine/spec/traits.dd traits.dd  # from the sibling destiny_engine checkout
rdmd generator.d
