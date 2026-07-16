# Nginx log parser and conversion to csv
1. A simple bash script that checks for and analyzes the Nginx web server log file access.log.
2. Converts it to csv format.
3. Automatically pushes the converted .csv file to a Git repository.

# Requirements to run this script, you only need the standard Linux utilities that are available by default:
- bash
- awk
- sed
- git

# How to use
1. Place the Nginx log file in the same directory as the script and name it "nginx.log". (Or change the file name in the script itself LOG_FILE=" ")

2. Make the script executable:
```
chmod u+x parser.sh
```
3. Run the script:
```
bash ./parser.sh
```

# How it works
1. The script checks for the existence of the 'nginx.log' file before running.
2. It uses 'awk' to extract the columns (IP, Date, Method, URL, Status) and 'sed' to clean up the excess.
3. The script automatically runs 'git add', 'git commit' and 'git push' to save the generated 'nginx_report.csv' to your Git repository.


# Dockerfile is created to convert log to csv. 

Create docker container:
docker build -t nginx-parser . 

Run container:
docker run --rm -v $(pwd):/app nginx-parser

