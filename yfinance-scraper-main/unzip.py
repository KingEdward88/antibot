import zipfile

# Specify the path to your zip file and the target directory
zip_file_path = 'catcppca-tests-main.zip'
extract_to_directory = 'base_files'

# Open the zip file in read mode ('r')
with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
    zip_ref.extractall(extract_to_directory)
    print("Files extracted successfully!")
