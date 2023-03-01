# Usage:
# ./copy-desk.sh <ship_name>

mkdir -p "../$1/recipes" && cp -R -f desk/* ../$1/recipes && echo "~$1" > ../$1/recipes/desk.ship


# Pulling relevant files from base
cp -R -f ../$1/base/mar/noun.hoon ../$1/recipes/mar/noun.hoon
cp -R -f ../$1/base/mar/kelvin.hoon ../$1/recipes/mar/kelvin.hoon

 # Pulling relevant files from garden
cp -R -f ../$1/garden/lib/docket.hoon ../$1/recipes/lib/docket.hoon
cp -R -f ../$1/garden/sur/docket.hoon ../$1/recipes/sur/docket.hoon
cp -R -f ../$1/garden/sur/treaty.hoon ../$1/recipes/sur/treaty.hoon

