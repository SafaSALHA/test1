node {

    stage('Clone Repo') {
        git branch: 'main', url: 'https://github.com/SafaSALHA/test1.git'
    }

    stage('Build Project') {
        dir('salutation') {
            sh "mvn clean package"
        }
    }

    stage('Build Docker Image') {
        dir('salutation') {
            sh "docker build -t safa318/test1:v1.0 ."
        }
    }

    stage('Push Docker Image') {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', 
                                          usernameVariable: 'DOCKER_USERNAME', 
                                          passwordVariable: 'DOCKER_PASSWORD')]) {
            sh '''
                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                docker push safa318/test1:v1.0
                docker logout
            '''
        }
    }

    stage('Deploy Docker Image') {
        echo "Déploiement de l'image Docker..."
        sh "docker run --name devopsexample -d -p 9999:8888 safa318/test1:v1.0"
    }
}

