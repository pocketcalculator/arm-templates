#!/bin/bash

subscription=''
region=eastus2
application=pocketcalculatorshow
environment=dev
owner=paul.sczurek@outlook.com
resourceGroupName=rg-$application-$environment-$region
vnetName=vnet-$application-$environment-$region
vnetCIDRPrefix=10.0

echo subscription = $subscription
echo location = $location
echo application = $application
echo environment = $environment
echo owner = $owner
echo resourceGroupName = $resourceGroupName
echo vnetName = $vnetName
echo vnetCIDRPrefix = $vnetCIDRPrefix

vmName=vm-web-$application-$environment-$region
adminUsername=pocketcalculatorshow
adminPasswordOrKey=@p0ck3tcalculat0rshow!
subnetName=snet-public-0
networkSecurityGroupName=sg-web

echo vmName = $vmName
echo adminUsername = $adminUsername
echo adminPasswordOrKey = $adminPasswordOrKey
echo subnetName = $subnnetName
echo networkSecurityGroupName = $networkSecurityGroupName

echo "Creating deployment for ${environment} ${application} compute..."
az deployment group create \
	--resource-group $resourceGroupName \
	--name $vnetName-deployment \
	--template-file ./compute.json \
	--parameters \
		"location=$region" \
	        "adminUsername=$adminUsername" \
       		"adminPasswordOrKey=$adminPasswordOrKey" \
        	"vmName=$vmName" \
        	"vnetName=$vnetName"
echo "Deployment for ${environment} ${application} compute is complete."
