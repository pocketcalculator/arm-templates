#!/bin/bash

subscription=''
region=EastUS2
application=armintro
environment=dev
owner=paul.sczurek@outlook.com
resourceGroupName=$application-$environment-rg
vnetName=$application-$environment-vnet
vnetCIDRPrefix=10.0

echo subscription = $subscription
echo region = $region
echo application = $application
echo environment = $environment
echo owner = $owner
echo resourceGroupName = $resourceGroupName
echo vnetName = $vnetName
echo vnetCIDRPrefix = $vnetCIDRPrefix

echo "Creating deployment for ${environment} ${application} vnet..."
az deployment group create \
	--resource-group $resourceGroupName \
	--name $application-$environment-resourceGroup \
	--template-file ./vnet.json \
	--parameters \
		"vnetName=$vnetName" \
		"vnetCIDRPrefix=$vnetCIDPrefix"
echo "Deployment for ${environment} ${application} vnet is complete."