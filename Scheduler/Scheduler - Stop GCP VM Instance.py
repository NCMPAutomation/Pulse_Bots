from google.cloud import compute_v1

instances_client = compute_v1.InstancesClient()
instances_client.stop(project="your_project_id", zone="your_zone", instance="your_instance_name")