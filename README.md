# untitled
## description
- template for deploy service to fargate using terraform.
## terraform
#### versions
- install tfenv
#### apply
- edit s3 bucket, region in "**terraform/backend.tf**".
- edit ecr image in "**terraform/ecs-task.tf".
- apply
  - `cd terraform`
  - `terraform init`
  - `terraform plan`
  - `terraform apply`
