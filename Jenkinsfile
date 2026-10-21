
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-credentials']
                ]) {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Approve Apply') {
            steps {
                input message: 'Do you want to create the EC2 instance?',
                      ok: 'Apply Terraform'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: 'aws-credentials']
                ]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        success {
            echo 'EC2 instance deployment completed successfully!'
        }

        failure {
            echo 'Pipeline failed. Check the Jenkins console output.'
        }

        always {
            sh 'rm -f tfplan'
        }
    }
}
