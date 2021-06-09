variable "project_id" {
    description = "Project ID"
}

variable "cluster_name" {
    description = "GKE cluster name"
}

variable "location" {

}

variable "node_count" {
    description = "number of worker nodes in cluster"
    default = 1
}

# variable "max_pods_per_node" {
#     description = "max number of pods per worker node"
# }

variable "http_load_balancing" {
    description = ""
    default = false
}

variable "horizontal_pod_autoscaling" {
    description = "scale out the number of pods" 
    default = false
}

# variable "custom_network" {

# }

# variable "custom_subnetwork" {

# }