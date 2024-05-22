#!/bin/bash

# Script para esperar hasta que la aplicación esté lista

# Ruta al archivo JAR de la aplicación
JAR_FILE="testing-web-0.0.1-SNAPSHOT.jar"
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

# Iniciar la aplicación en segundo plano
chmod +x $JAR_FILE
java -jar $JAR_FILE > /dev/null 2>&1 &

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
