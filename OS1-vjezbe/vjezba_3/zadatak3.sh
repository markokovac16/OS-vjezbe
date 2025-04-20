if [ ! -d "screenshots" ]; then
    echo "Greška: Direktorij 'screenshots' ne postoji."
    exit 1
fi

broj=1

for datoteka in "screenshots"/*; do
    if [ -f "$datoteka" ]; then
        ime_datoteke=$(basename "$datoteka")
        novo_ime="screenshots/screenshot_${broj}_${ime_datoteke}"
        mv "$datoteka" "$novo_ime"
        echo "Datoteka preimenovana: $novo_ime"
        ((broj++))
    fi
done

echo "Preimenovanje datoteka završeno. Ukupno preimenovano: $((broj-1)) datoteka."