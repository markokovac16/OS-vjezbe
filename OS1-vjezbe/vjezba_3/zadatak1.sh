if [ $# -ne 2 ]; then
    echo "Greška: Potrebno je proslijediti točno 2 argumenta."
    echo "Upotreba: $0 <putanja_do_direktorija> <nastavak>"
    exit 1
fi

direktorij=$1
nastavak=$2

if [ ! -d "$direktorij" ]; then
    echo "Greška: Direktorij '$direktorij' ne postoji."
    exit 1
fi

found=0
for datoteka in "$direktorij"/*"$nastavak"; do
    if [ -f "$datoteka" ]; then
        echo "$(basename "$datoteka")"
        found=1
    fi
done

if [ $found -eq 0 ]; then
    echo "U direktoriju '$direktorij' nema datoteka s nastavkom '$nastavak'."
fi