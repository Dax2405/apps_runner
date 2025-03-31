

echo "Dax Apps Runner"
echo "------------------"

echo "Iniciando el contenedor de Dax Apps..."

echo "Elija la app que desea iniciar:"
echo "1. OSINT"

read -p "Ingrese el número de la app: " app_choice

if [ $app_choice == 1 ]; then 
    ./OSINT/run.sh
fi





function ctrl_c() {
    echo "Saliendo..."
    exit 1
}

trap ctrl_c INT