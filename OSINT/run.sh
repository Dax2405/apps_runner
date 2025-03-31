# Verificar y clonar el repositorio osint-api si no existe
cd OSINT
if [ ! -d "osint-api" ]; then
    echo "Clonando el repositorio osint-api..."
    git clone https://github.com/Dax2405/osint-api
else
    echo "El repositorio osint-api ya existe."
fi

# Verificar y clonar el repositorio osint-web si no existe
if [ ! -d "osint-web" ]; then
    echo "Clonando el repositorio osint-web..."
    git clone https://github.com/Dax2405/osint-web
else
    echo "El repositorio osint-web ya existe."
fi

# Crear el entorno virtual si no existe
if [ ! -d ".venv" ]; then
    echo "Creando el entorno virtual..."
    python3 -m venv .venv
    # Activar el entorno virtual
    source .venv/bin/activate

    # Instalar dependencias
    pip install -r osint-api/requirements.txt
fi


source .venv/bin/activate

# iniciar la api

python osint-api/run.py &

# Iniciar la web

cd osint-web
npm install --force
npm run dev

function ctrl_c() {
    echo "Saliendo..."
    # Detener la API
    kill $(jobs -p)
    # Detener la web
    npm stop
    exit 1
}

trap ctrl_c INT