# Nombre del repositorio y usuario
repo="InfinityHacks"
usuario="InfinityStudioYT"

ruta=~/$repo

if [ -d $ruta ]; then
	rm -rf $ruta
fi

# Clonar el repositorio (si no existe)

if [ ! -d $repo ]; then
  cd $HOME
  git clone "https://github.com/$usuario/$repo.git"
fi

# Cambiar al directorio del repositorio
cd $ruta

# Verificar si hay cambios remotos
if git fetch origin master | grep 'new commits'; then
  # Hay cambios remotos
  echo "El repositorio $repo está desactualizado. Actualizando..."
  git pull
  echo "Actualización completada."
else
  # No hay cambios remotos
  echo "El repositorio $repo está actualizado."
fi
