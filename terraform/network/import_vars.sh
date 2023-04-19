read -p "Secret Name: " secretName

if [ -z $secretName ]
then
        echo "You must type secret name"
        exit 0
fi

read -p "env: " env

if [ -z $env ]
then
        echo "You must type env"
        echo "Default: dev"
        exit 0
fi

aws secretsmanager get-secret-value --secret-id $secretName | jq --raw-output '.SecretString'> $env.json
