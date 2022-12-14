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
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64'
                    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipeline-project/D* ubuntu@54.189.116.64:/home/ubuntu/'
                    
                }
            }
          
        }
        stage("docker image build in ansible"){
            steps{
                sshagent(['ansible-node']) {
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 cd /home/ubuntu'
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 docker image build -t  httpd:v1 .' 
                    
                }
           }

        }
        stage("tagging the docker image"){
            steps{
                sshagent(['ansible-node']) {
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 cd /home/ubuntu'
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 docker image tag httpd:v1 sivaprasad/httpd:v1'
               }
           }
        } 
        stage("push the docker image in docker hub"){
            steps{
                sshagent(['ansible-node']) {
                    withCredentials([string(credentialsId: 'docker-passwd', variable: 'docker-passwd')]) {
                       sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 docker login -u sivaprasad1996 p $(docker-passwd)'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 cd /home/ubuntu'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64 docker image push sivaprasad1996/httpd:v1'
                    }
               }    
            }
        }
    }
}     
