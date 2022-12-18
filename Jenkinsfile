pipeline{
    agent any
        stages{
        stage("SCM"){
            steps{
               git branch: 'main', url: 'https://github.com/siva-pra/jenkins-ansible-minikube-project.git'
           
            }
        }
        stage("dockerfile transfor ansible"){
            steps{
                sshagent(['ansible-node']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246'
                    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipeline-project/D* ubuntu@54.212.143.246:/home/ubuntu/'
                    
                }
            }
          
        }
        stage("docker image build in ansible"){
            steps{
                sshagent(['ansible-node']) {
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 cd /home/ubuntu'
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 docker image build -t  httpd:v1 .' 
                    
                }
           }

        }
        stage("tagging the docker image"){
            steps{
                sshagent(['ansible-node']) {
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 cd /home/ubuntu'
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 docker image tag httpd:v1 sivaprasad1996/httpd:v1'
               }
           }
        } 
        stage("push the docker image in docker hub"){
            steps{
                sshagent(['ansible-node']) {
                    withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'dockerhub_passwd')]) {
                       sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 docker login -u sivaprasad1996 -p $(dockerhub_passwd)'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 cd /home/ubuntu'
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.212.143.246 docker image push sivaprasad1996/httpd:v1'
                    }
               }    
            }
        }
    }
}     
