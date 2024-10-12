
// En el archivo variables las definimos, pero el valor de los secret los tenemos en otro file

// sensitive true es para que no nos imprima la var en consola


variable "access_key" {

    description = "access_key"
    type = string
    sensitive = true
  
}

variable "secret_key" {

    description = "secret_key"
    type = string
    sensitive = true
  
}

variable "service_names" {
  
  description = "Name of the EC2 repositories"
  type        = set(string)

}

