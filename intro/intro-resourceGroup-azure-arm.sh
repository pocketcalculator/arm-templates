#!/bin/bash

subscription=''
region=EastUS2
application=armintro
environment=dev
owner=paul.sczurek@outlook.com
resourceGroupName=$application-$environment-rg

echo subscription = $subscription
echo region = $region
echo application = $application
echo environment = $environment
echo owner = $owner
echo resourceGroupName = $resourceGroupName

echo "Creating deployment for ${environment} ${application} resource group..."
az deployment sub create \
	--name $application-$environment-resourceGroup \
	--template-file ./resourceGroup.json \
	--parameters \
		"resourceGroupName=$resourceGroupName" \
		"region=$region" \
	--location $region
echo "Deployment for ${environment} ${application} resource group is complete."