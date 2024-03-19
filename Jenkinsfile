pipeline {
    agent any

    stages {
        stage('TEST Terraform Code') {
            steps {
                script {
                    dir('main-project-terraform') {
                    }
                }
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    dir('main-project-terraform') {
                        sh 'terraform init'
                    }
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    dir('main-project-terraform') {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    dir('main-project-terraform') {
                        sh 'terraform apply tfplan'
                    }
                }
            }
        }
    } 
}
