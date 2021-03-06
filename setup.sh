ping -c 1 -q google.com >&/dev/null;
if [ $? != 0 ]
then
  echo 'no internet connection. try again later...';
  exit 1;
fi

which docker >&/dev/null;
if [ $? != 0 ]
then
  echo 'no docker installed on system. install docker and run script again.';
fi

which docker-compose >&/dev/null;
if [ $? != 0 ]
then
  echo 'no docker-compose installed on system. install docker-compose and run script again.';
fi

echo 'executing docker-compose. initializing...';
docker network create registry_default;
docker network create portainer_default;

if [ $# != 0 ]
then
  if [ $1 = '-withRegistry' ]
  then
    docker-compose -f install/setup.full.yml --env-file install/.env up -d;
    echo 'droplet initialized.';
    exit 0;
  fi
fi

docker-compose -f install/setup.yml --env-file install/.env up -d;
echo 'droplet initialized.';
exit 0;