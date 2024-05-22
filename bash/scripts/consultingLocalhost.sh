#!/bin/bash

# Puerto al que se realizará la solicitud
PORT=8080
# Número máximo de intentos
MAX_RETRIES=12
# Tiempo de espera entre intentos (en segundos)
WAIT_TIME=5

# Función para realizar una solicitud HTTP
function make_request() {
  curl -I http://localhost:$PORT/
}

# Esperar hasta que la aplicación esté lista
for ((i=1; i<=$MAX_RETRIES; i++)); do
  if make_request; then
    echo "La aplicación está lista."
    exit 0
  fi
  echo "Intento $i: La aplicación no está lista, esperando $WAIT_TIME segundos..."
  sleep $WAIT_TIME
done

echo "Número máximo de intentos alcanzado. La aplicación no se inició correctamente."
exit 1
