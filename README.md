# Apigee-X-Eval-Org-Provisioning


To prepare your GCP project for running the terraform script, you’ll have to enable the following Google APIs:

apigee.googleapis.com
compute.googleapis.com
servicenetworking.googleapis.com
You can do this by running the following command:

 
	export PROJECT_ID=my-project-id
	gcloud services enable compute.googleapis.com apigee.googleapis.com servicenetworking.googleapis.com --project $PROJECT_ID
 

 ..


	terraform init
	terraform plan --var-file="my-x-eval.tfvars" -var=project_id=$PROJECT_ID


If you are happy with the plan, you can provision your org like this:
 

	terraform apply --var-file="my-x-eval.tfvars" -var=project_id=$PROJECT_ID


..


	export TOKEN=$(gcloud auth print-access-token) 
	curl -H "Authorization: Bearer $TOKEN" https://apigee.googleapis.com/v1/organizations/$PROJECT_ID/instances


