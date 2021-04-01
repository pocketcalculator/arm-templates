#!/bin/bash

subscription=''
region=EastUS2
application=armintro
environment=dev
owner=paul.sczurek@outlook.com
resourceGroupName=$application-$environment-rg
vnetName=$application-$environment-vnet

echo subscription = $subscription
echo region = $region
echo application = $application
echo environment = $environment
echo owner = $owner
echo resourceGroupName = $resourceGroupName
echo vnetName = $vnetName

echo "Creating deployment for ${environment} ${application} vnet..."
az deployment group create \
	--rollback-on-error \
	--resource-group $resourceGroupName \
	--name $application-$environment-resourceGroup \
	--template-file ./vnet.json \
	--parameters \
		"vnetName=$vnetName"
echo "Deployment for ${environment} ${application} vnet is complete."