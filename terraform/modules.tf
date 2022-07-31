module "network" {
  source           = "./untitled/"
  mapping_port     = "8080"
  docker_image_url = "public.ecr.aws/y6z2k0q4/untitled:latest"
}