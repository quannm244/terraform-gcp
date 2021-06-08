resource "google_service_account" "cluster" {
    account_id = "cluster-sa"
    display_name = "Cluster Service Account"
}

resource "google_container_cluster" "test-cluster" {
    project = var.project_id
    name = var.cluster_name
    location = var.location

    # min_master_version = "1.16"

    remove_default_node_pool = true
    initial_node_count = 1

    node_config {
        
        service_account = google_service_account.cluster.email
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ] 
    }  

    # ip_allocation_policy {
    #     cluster_ipv4_cidr_block = "/14"
    #     services_ipv4_cidr_block = "/20"
    # }

    # network = var.custom_network.id
    # subnetwork = var.customer_subnetwork.id

}

resource "google_container_node_pool" "preemptible_nodes" {
    name = "worker-pool"
    project = google_container_cluster.test-cluster.project
    cluster = google_container_cluster.test-cluster.name
    location = google_container_cluster.test-cluster.location 
    node_count = 1

    node_config {
        image_type = "COS_CONTAINERD"
        preemptible = true
        machine_type = "f1-micro"

        service_account = google_service_account.cluster.email
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ] 
    }  
}