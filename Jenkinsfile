// pipeline {
//     agent {label 'agent_cicd'}
    
//     stages{
//         stage("Code"){
//             steps{
//                 git url: "https://github.com/pias97/two-tier-flask-app.git", branch: "main"
//                 echo "cloning the code"
//             }
//         }
//         stage("Build & Test"){
//             steps{
//                 sh "docker build . -t flaskapp"
//             }
//         }
//         stage("Push to DockerHub"){
//             steps{
//                 withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
//                     sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
//                     sh "docker tag flaskapp ${env.dockerHubUser}/flaskapp:latest"
//                     sh "docker push ${env.dockerHubUser}/flaskapp:latest" 
//                 }
//             }
//         }
//         stage("Deploy"){
//             steps{
//                 sh "docker-compose down && docker-compose up -d"
//             }
//         }
//     }
// }














pipeline {
    agent {label 'agent_cicd'}
    
    stages{
        stage("Code"){
            steps{
                git url: "https://github.com/pias97/two-tier-flask-app.git", branch: "main"
                echo "cloning the code"
            }
        }
        stage("Build"){
            steps{
                echo "buiding the image"
                sh "docker build -t pias97/two-tier-flaskapp:latest ."
            }
        }
        stage("Push to DockerHub"){
            steps{
                echo "pushing the code"
                }
            }

        stage("Deploy"){
            steps{
                echo "deploying the app"
                sh "sudo docker run -d -p 5000:5000 pias97/two-tier-flaskapp:latest"
            }
        }
    }
}

