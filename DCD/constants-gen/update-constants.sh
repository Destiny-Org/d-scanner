#!/bin/sh
wget https://raw.githubusercontent.com/Destiny-Org/destiny/main/spec/pragma.dd -O pragma.dd
wget https://raw.githubusercontent.com/Destiny-Org/destiny/main/spec/traits.dd -O traits.dd
rdmd generator.d
