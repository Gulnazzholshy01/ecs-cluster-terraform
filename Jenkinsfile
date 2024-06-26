
pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_TAG', defaultValue: '', description: 'Image tag to deploy')
    }

    options {
        ansiColor('xterm')
    }
    
    stages {
        stage('Plan') {
            steps {
                dir("ecs-cluster") {
                    sh 'terraform init'
                    sh "terraform plan -var 'image_tag=${params.IMAGE_TAG}' "
                }
            }
        }
  
        stage('Apply') {
            steps {
                script {
                    dir("ecs-cluster") {
                      echo "Running terraform apply"
                        sh "terraform apply -var 'image_tag=${params.IMAGE_TAG}' --auto-approve"
                    }  
                }  
            }
        }
    }

    post('Post Actions') {
       always {
           echo '### Clean workspace ###'
           cleanWs()
        }
     }
}