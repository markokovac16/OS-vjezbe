#!/bin/bash

for datoteka in ~/old_dir/*; do
    mv "$datoteka" ~/new_dir/
    echo "Datoteka prebačena"
    sleep 1
done