pipeline {
    agent any

    environment {
        NODE_VERSION = '18'  // or your preferred Node.js version
        AWS_REGION = 'us-east-1'  // e.g., us-east-1
        S3_BUCKET = 'nuxt-app-jenkins-s3'
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Setup') {
            steps {
                nvm(version: "${NODE_VERSION}") {
                    // Install dependencies
                    sh 'npm ci'

                // config aws credentials
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding', 
                    credentialsId: 'aws-credentials'
                ]]) {
                    sh '''
                    aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                    aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                    aws configure set region $AWS_REGION
                    '''
                    }
                }
                
            }
        }

        stage('Build') {
            steps {
                // Generate static files
                sh 'npm run generate'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy to S3

                // method 1
                // withAWS(region: "${AWS_REGION}", credentials: 'aws-credentials') {
                //     s3Upload(
                //         bucket: "${S3_BUCKET}",
                //         path: '/',
                //         includePathPattern: '**/*',
                //         workingDir: '.output/public',
                //         acl: 'public-read'
                //     )
                // }

                sh '''
                aws s3 ls # Example: List S3 buckets
                echo "Retrieving secrets from AWS Secrets Manager..."
                NR_KEY=$(aws secretsmanager get-secret-value --secret-id "admin/app/dev/NR_KEY" --query SecretString --output text)

                # Append secrets to .env file
                echo "Adding secrets to .env file..."
                echo "NR_KEY=${NR_KEY}"
                echo "NR_KEY=${NR_KEY}" >> .env
                '''
            }
        }
    }
}
