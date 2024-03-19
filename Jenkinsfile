pipeline {
    agent any

    stages {
        stage('Fetch Terraform Code') {
            sh 'ls'
            sh 'pws'
            sh 'git --version'
            sh 'cat Jenkinsfile'
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
