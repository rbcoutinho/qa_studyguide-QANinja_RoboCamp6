pipeline {
    agent {
        docker {
            image 'qaninja/python-wd'
            args '--network=zepalheta-network'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        
        stage('API Test') {
            steps {
                sh 'robot -d ./logs tests/api'               
            }
        }
    }
    post {
        always {
            robot 'logs'
        }
    }
}
