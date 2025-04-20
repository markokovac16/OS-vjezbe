if [ $# -ne 1 ]; then
    echo "Greška: Potrebno je proslijediti točno 1 argument."
    echo "Upotreba: $0 <naziv_direktorija>"
    exit 1
fi

direktorij=$1

if [ ! -d "$direktorij" ]; then
    echo "Greška: Direktorij '$direktorij' ne postoji u trenutnom direktoriju."
    exit 1
fi

zip_datoteka="svi_zapisi.zip"

file_count=$(ls -1 "$direktorij" | wc -l)
if [ "$file_count" -eq 0 ]; then
    echo "Direktorij '$direktorij' je prazan. Nema datoteka za komprimiranje."
    exit 1
fi

cd "$direktorij" || exit 1
zip -r "../$zip_datoteka" ./*

if [ $? -eq 0 ]; then
    echo "Datoteke iz direktorija '$direktorij' uspješno su komprimirane u datoteku '$zip_datoteka'."
else
    echo "Greška prilikom komprimiranja datoteka."
    exit 1
fi