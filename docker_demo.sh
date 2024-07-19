# Please note that it will take some time to create a docker e
docker build -t milessic-robot .
docker run --rm -v $(pwd):/robot milessic-robot -d results .
if [[ "$1" == "delete-after" ]]
then 
docker rmi milessic-robot
fi

