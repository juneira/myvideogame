variable "sns_name" {
  description = "Name of the sns topic to be created. You can assign any unique name for the Topic"
  default = "any-sns"
}

variable "endpoint" {
  description = "Endpoint used for the subscriber"
}

variable "protocol" {
  description = "Type of protocol used for the subscriber"
}