provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "test" {
  ami                     = "abc-1234"
  instance_type           =  var.region_instance["us-east-1"]
  
  
}
variable "list" {
    type = list
    default = ["t2.micr0","t2.small","t2.medium"]

    
}
variable "region_instance" {
    type = map
    default = {
        "us-east-1"="t2.micro"
        "us-west-1"="t2.namo"
        "us-north-1"="t2.medium"
    }
}