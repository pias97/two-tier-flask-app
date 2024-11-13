pipeline {
    agent {label 'agent_cicd'}
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/pias97/two-tier-flask-app.git", branch: "main"
                echo "cloning the code"
            }
        }
        stage("Build and Push to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dokcer_hub_cred",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    echo "buiding the image"
                    sh "docker build -t ${env.dockerHubUser}/two-tier-flaskapp:latest ."
                    echo "pushing the image"
                    sh "docker push ${env.dockerHubUser}/two-tier-flaskapp:latest" 
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "deploying the app"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}

