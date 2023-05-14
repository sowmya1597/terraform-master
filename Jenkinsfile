pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: '822152d0-44bf-4afb-8e6b-393f47452f8c', url: 'https://github.com/sowmya1597/terraform-master.git'
            }
        }

        stage('Terraform') {
            
            steps {
                // Run the run.sh script with environment variables
                   sh 'chmod +x run.sh'
                    sh './run.sh'
                
            }
        }
    }
}
