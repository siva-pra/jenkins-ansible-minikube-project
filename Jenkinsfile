pipeline{
    agent any
    triggers { pollSCM('H * * * 1-5') }
    stages{
        stage("SCM"){
            steps{
               git branch: 'main', url: 'https://github.com/siva-pra/jenkins-ansible-minikube-project.git'
           
            }
        }
        stage("dockerfile transfor ansible"){
            steps{
                sshagent(['ansible-node']) {
                    sh "scp -o StrictHostKeyChecking=no  /var/lib/jenkins/workspace/pipeline-project/* ubuntu@54.189.116.64 /home/ubuntu"
                    sh "ssh -o StrictHostKeyChecking=no cp -r /home/ubuntu/* ubuntu@54.189.116.64 cd /home/ubuntu/docker"
                    
                }
            }
            
        }
    
    }

}