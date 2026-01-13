
#!/bin/bash

###############################################
# Author: Amir Shaikh
# Date: 13/01/2026
# Version: v1.0
#
# Description:
# This script generates a daily AWS resource usage report.
# It collects information about:
#   - S3 Buckets
#   - EC2 Instances
#   - Lambda Functions
#   - IAM Users
# The output is saved in date-wise log files for auditing,
# monitoring, and compliance purposes.
#
# Best Practices Followed:
#   ✔ Uses full command paths (cron safe)
#   ✔ Date-wise log files
#   ✔ Auto directory creation
#   ✔ Captures both output and errors
#   ✔ Debug enabled for troubleshooting
###############################################



# Run the Script in Debug Mode
set -x


# Get Today's Date
DATE=$(date +%F)


# Create a Log Directory & File Name [Directory → ~/aws-reports/]  && [File  → aws_report_2026-01-13.log]
LOGDIR="$HOME/aws-reports"
LOGFILE="$LOGDIR/aws_report_$DATE.log"


# Create a Folder if Missing
mkdir -p "$LOGDIR"


# Redirect All Output Into Log File [ >> Append output]  &&  [ 2>&1 Send errors also into same file ]
exec >> "$LOGFILE" 2>&1


# Print Report Header
echo "===== AWS REPORT : $DATE ====="


# Find Exact Paths of Commands
AWS="$(which aws)"
JQ="$(which jq)"


# List S3 Buckets
echo "Print list of s3 buckets"
$AWS s3 ls


# List EC2 Instances
echo "Print list of ec2 instances"
$AWS ec2 describe-instances | $JQ '.Reservations[].Instances[].InstanceId'


# List Lambda Functions
echo "Print list of Lambda Functions"
$AWS lambda list-functions


# List IAM Users
echo "Print list of IAM Users"
$AWS iam list-users
