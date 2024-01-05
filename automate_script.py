import paramiko
import subprocess

# Function to execute commands on remote server
def execute_command(server_ip, username, password, command):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        ssh.connect(server_ip, username=username, password=password)
        stdin, stdout, stderr = ssh.exec_command(command)
        output = stdout.read().decode('utf-8')
        return output
    except Exception as e:
        return f"Error connecting to {server_ip}: {str(e)}"
    finally:
        ssh.close()

# Get Terraform outputs using subprocess
node_1_ip = subprocess.check_output(["terraform", "output", "node_1_vm_ip"]).strip().decode('utf-8')
node_2_ip = subprocess.check_output(["terraform", "output", "node_2_vm_ip"]).strip().decode('utf-8')
node_3_public_ip = subprocess.check_output(["terraform", "output", "node_3_public_ip"]).strip().decode('utf-8')
jenkins_ip = subprocess.check_output(["terraform", "output", "node_jenkins_ip"]).strip().decode('utf-8')

# Set your Azure credentials
azure_username = "azure"
azure_password = "Password@123"

# Example command to run on each server
command_to_run = "echo 'Hello, world!'"

# Execute commands on each server
outputs = {
    "Node 1": execute_command(node_1_ip, azure_username, azure_password, command_to_run),
    "Node 2": execute_command(node_2_ip, azure_username, azure_password, command_to_run),
    "Node 3": execute_command(node_3_public_ip, azure_username, azure_password, command_to_run),
    "Jenkins": execute_command(jenkins_ip, azure_username, azure_password, command_to_run)
}

# Print the outputs
for server, output in outputs.items():
    print(f"Output from {server}:\n{output}")
