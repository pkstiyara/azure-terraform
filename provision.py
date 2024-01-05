import paramiko
import subprocess

# Function to execute commands on remote server
def execute_commands(server_ip, username, password, commands):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        ssh.connect(server_ip, username=username, password=password)

        # Execute each command and store the output
        outputs = []
        for command in commands:
            stdin, stdout, stderr = ssh.exec_command(command)
            output = stdout.read().decode('utf-8')
            outputs.append(output)

        return outputs
    except Exception as e:
        return [f"Error connecting to {server_ip}: {str(e)}"]
    finally:
        ssh.close()

# Get Terraform outputs using subprocess
try:
    node_1_ip_output = subprocess.check_output(["terraform", "output", "node_1_vm_ip"]).strip().decode('utf-8').strip('"')
    node_2_ip_output = subprocess.check_output(["terraform", "output", "node_2_vm_ip"]).strip().decode('utf-8').strip('"')
    node_3_public_ip_output = subprocess.check_output(["terraform", "output", "node_3_public_ip"]).strip().decode('utf-8').strip('"')
    node_jenkins_ip_output = subprocess.check_output(["terraform", "output", "node_jenkins_ip"]).strip().decode('utf-8').strip('"')

    print(f"Output from Terraform - Node 1: {node_1_ip_output}")
    print(f"Output from Terraform - Node 2: {node_2_ip_output}")
    print(f"Output from Terraform - Node 3: {node_3_public_ip_output}")
    print(f"Output from Terraform - Jenkins: {node_jenkins_ip_output}")
except subprocess.CalledProcessError as e:
    print(f"Error while getting Terraform output: {e}")
    # Handle the error or exit the script if needed
    exit()

# Set your Azure credentials
azure_username = "azure"
azure_password = "Password@123"

# Commands to run on each server
commands_to_run = [
    "sudo yum update -y",
    "echo 'Successfully updated'",
    "sudo yum install git -y",
    "git --version"
]

# Execute commands on each server
outputs_node_1 = execute_commands(node_1_ip_output, azure_username, azure_password, commands_to_run)
outputs_node_2 = execute_commands(node_2_ip_output, azure_username, azure_password, commands_to_run)
outputs_node_3 = execute_commands(node_3_public_ip_output, azure_username, azure_password, commands_to_run)
outputs_jenkins = execute_commands(node_jenkins_ip_output, azure_username, azure_password, commands_to_run)

# Print the outputs
print(f"Output from Node 1 at {node_1_ip_output}:\n{outputs_node_1}")
print(f"Output from Node 2 at {node_2_ip_output}:\n{outputs_node_2}")
print(f"Output from Node 3 at {node_3_public_ip_output}:\n{outputs_node_3}")
print(f"Output from Jenkins at {node_jenkins_ip_output}:\n{outputs_jenkins}")
