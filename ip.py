import subprocess

# Get Terraform output using subprocess
try:
    node_1_ip_output = subprocess.check_output(["terraform", "output", "node_1_vm_ip"]).strip().decode('utf-8')
    print(f"Output from Terraform: {node_1_ip_output}")
except subprocess.CalledProcessError as e:
    print(f"Error while getting Terraform output: {e}")
    # Handle the error or exit the script if needed
    exit()