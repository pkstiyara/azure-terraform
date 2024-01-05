import paramiko

# Define Azure VM and Jenkins IP addresses
node_1_ip = "20.237.186.0"
node_2_ip = "20.168.158.29"
node_3_public_ip = "20.237.186.87"
jenkins_ip = "20.245.51.14"

# Set your Azure credentials
azure_username = "azure"
azure_password = "Password@123"  # Replace with your actual password

# Example command to run on each server
command_to_run = "sudo yum update -y"

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
