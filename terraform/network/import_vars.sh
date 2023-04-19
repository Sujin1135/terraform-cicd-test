secretName=$1

if [ -z $secretName ]
then
  read -p "Secret Name: " secretName
fi

if [ -z $secretName ]
then
        echo "You must type secret name"
        exit 0
fi

env=$2

if [ -z $env ]
then
  read -p "env: " env
fi

if [ -z $env ]
then
        echo "You must type env"
        echo "Default: dev"
        exit 0
fi

aws secretsmanager get-secret-value --secret-id $secretName | jq --raw-output '.SecretString'> $env.json
