#!/bin/bash

subscription=''
region=eastus2
application=pocketcalculatorshow
environment=dev
owner=paul.sczurek@outlook.com
resourceGroupName=rg-$application-$environment-$region

echo subscription = $subscription
echo region = $region
echo application = $application
echo environment = $environment
echo owner = $owner
echo resourceGroupName = $resourceGroupName

echo "Creating deployment for ${environment} ${application} resource group..."
az deployment sub create \
	--name rg-$application-$environment-$region-deployment \
	--template-file ./resourceGroup.json \
	--parameters \
		"resourceGroupName=$resourceGroupName" \
		"region=$region" \
	--location $region
echo "Deployment for ${environment} ${application} resource group is complete."