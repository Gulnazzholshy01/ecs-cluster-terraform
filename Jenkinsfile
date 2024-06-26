
pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_TAG', defaultValue: '', description: 'Image tag to deploy')
    }

    stages {
        stage('Plan') {
            steps {
                dir("ec2-terraform") {
                    sh 'terraform init'
                    sh "terraform plan -var 'image_tag=${params.IMAGE_TAG}' -auto-approve"
                }
            }
        }
  
        stage('Apply') {
            steps {
                script {
                    dir("ec2-terraform") {
                      echo "Running terraform apply"
                        sh "terraform apply -var 'image_tag=${params.IMAGE_TAG}' -auto-approve"
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