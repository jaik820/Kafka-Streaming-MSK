# Step 1 : Create RDS Database in Amazon using SQL Server Edition

# Step 2 : Create Database, table , enable CDC on table and insert the data into table and execute scripts under folder - SQL Server Script

# Step 3 : Create S3 Bucket , and Setup S3 VPC endpoint
          a. When creating endpoint choose type "Gateway" and service name "com.amazonaws.us-east-1.s3" (change region according to your bucket)


# Step 3: Create MSK Cluster
          a. Cluster type : Provisioned
          b. Security group : allow inbound and outbound traffic from everywhere (you can keep it more restricted to allow only from required sources)
          c. Authentication type : IAM 

# Step 4: Create an IAM Role for MSK with the policy given in Repo
          a. IAM policy details given here : IAM/MSKConnectorRole.json

# Step 5: Create connector plugins for SQL Server Source and S3 Sink
          a. Debezium Connector for SQL Server : https://www.confluent.io/hub/debezium/debezium-connector-sqlserver
          b. Kafka-S3-Sink Connector: https://www.confluent.io/hub/confluentinc/kafka-connect-s3

# Step 6: Create the source connector
          follow the steps explained in the video to create the source connector 
          
# Step 7: Create S3 Sink Connector

# Step 8: Verify the data in target S3 Bucket
