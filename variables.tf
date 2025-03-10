variable "git" {
  description = "Exact name of your git repository"
  type        = string
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  type        = string
  description = "Name used to identify resources"
  default     = "account-default"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "enable_random_suffix" {
  description = "Append a random identifier to the name"
  type        = bool
  default     = false
}

variable "max_retention_days" {
  description = "The maximum retention period that the vault retains its recovery points."
  type        = number
  default     = 365
}

variable "min_retention_days" {
  description = "The minimum retention period that the vault retains its recovery points."
  type        = number
  default     = 3
}