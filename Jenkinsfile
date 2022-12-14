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
        stage("dockerfile transfor ansible"){
            steps{
                sshagent(['ansible-node']) {
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64'
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64:cd /home/ubuntu'
                   sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64:docker image build -t  $(bulild_name):$(build_no) .' 
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.189.116.64:docker images' 
                }
    
    }

}