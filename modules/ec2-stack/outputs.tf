output "intance_names" {
    value = {
        web = [for i in aws_instance.web : i.tags["Name"]]
    }
}

output "instance_ids" {
    value = {
        web = [for i in aws_instance.web : i.id]
    }
}

# Just figured this... kinda cool 
output "instance_details" {
    value = {
        web = {
            names = [for instances in aws_instance.web : instances.tags["Name"]]
            ids = [for instances in aws_instance.web : instances.id]
            azs = [for instances in aws_instance.web : instances.availability_zone]
        }
    }
}