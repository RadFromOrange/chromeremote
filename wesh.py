import os
import subprocess
import sys

def extract_dependencies(deb_path):
    # Extract dependency information from the .deb package
    result = subprocess.run(['sudo','dpkg-deb', '-I', deb_path], capture_output=True, text=True)
    dependencies = []
    for line in result.stdout.split('\n'):
        if line.startswith(' Depends:'):
            dependencies.extend(line.split(':')[1].strip().split(','))

    # Extract package names from dependencies with version requirements
    final_dependencies = []
    for dependency in dependencies:
        dependency_parts = dependency.split()
        final_dependencies.append(dependency_parts[0])

    return final_dependencies

def download_packages(dependencies, deb_path, target_folder):
    # Create target folder if it doesn't exist
    if not os.path.exists(target_folder):
        os.makedirs(target_folder)

    # Download main package and dependencies into the target folder

    subprocess.run(['sudo','apt-get', 'download', '--allow-unauthenticated', '--allow-downgrades', '--allow-remove-essential', '--allow-change-held-packages', '-o', f'Dir::Cache::archives={target_folder}', deb_path])
    for dependency in dependencies:
        print("downaloding :"+ dependency)
        subprocess.run(['sudo','apt-get', 'download', '--allow-unauthenticated', '--allow-downgrades', '--allow-remove-essential', '--allow-change-held-packages', '-o', f'Dir::Cache::archives={target_folder}', dependency])

def install_packages(deb_path, target_folder):
    # Install the main package and dependencies into the target folder
    subprocess.run(['sudo','dpkg', '-i', '--root=' + target_folder, os.path.join(target_folder, os.path.basename(deb_path))])
    subprocess.run(['sudo','dpkg', '-i', '--root=' + target_folder] + [os.path.join(target_folder, f) for f in os.listdir(target_folder) if f.endswith('.deb')])

def main(deb_path, target_folder):
    dependencies = extract_dependencies(deb_path)
    download_packages(dependencies, deb_path, target_folder)
    install_packages(deb_path, target_folder)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <deb_path> <target_folder>")
        sys.exit(1)

    deb_path = sys.argv[1]
    target_folder = sys.argv[2]
    main(deb_path, target_folder)
