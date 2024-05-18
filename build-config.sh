#!/bin/bash

# Login to your DockerHub account.
# Create a public repository.
# Generate an access token to access your DockerHub account.

dockerhub_token="[add-dockerhub-access-token]"
dockerhub_username="[add-dockerhub-username]"

apim_image="$dockerhub_username/[dockerhub-repo-name]:[tag]"
mysql_image="$dockerhub_username/[dockerhub-repo-name]:[tag]"

echo "Building docker image $apim_image..."
docker build --no-cache -t $apim_image ./wso2-apim/apim-instance
if [ $? -ne 0 ]
then
   echo $? 2>/dev/null 1>/dev/null
   echo "$apim_image build failed"
else
   echo "$apim_image build completed"
fi

echo "Building docker image $mysql_image..."
docker build --no-cache -t $mysql_image ./mysql-server/mysql-instance
if [ $? -ne 0 ]
then
   echo $? 2>/dev/null 1>/dev/null
   echo "$mysql_image build failed"
else
   echo "$mysql_image build completed"
fi

echo "Trying to login $dockerhub_username"
docker login  --username $dockerhub_username --password $dockerhub_token 2>/dev/null 1>/dev/null 0>/dev/null
if [ $? -ne 0 ]
then
   echo $? 2>/dev/null 1>/dev/null
   echo "$dockerhub_username login failed"
else
   echo "$dockerhub_username login successfull"
fi

echo "Pushing $apim_image to DockerHub..."
docker push $apim_image
if [ $? -ne 0 ]
then
   echo $? 2>/dev/null 1>/dev/null
   echo "$apim_image push failed"
else
   echo "$apim_image push successfull"
fi

echo "Pushing $mysql_image to DockerHub..."
docker push $mysql_image
if [ $? -ne 0 ]
then
   echo $? 2>/dev/null 1>/dev/null
   echo "$mysql_image push failed"
else
   echo "$mysql_image push successfull"
fi


