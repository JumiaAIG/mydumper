pipeline {
    agent none

    options {
        buildDiscarder(logRotator(numToKeepStr: '3', artifactNumToKeepStr: '3'))
    }

    stages {
        stage('Build') {
            agent { dockerfile true }
            environment {
                NEXUS_CREDENTIALS = credentials('nexus_jenkins_credentials')
                NEXUS_REPO_URI = "http://nexus.live.jvc:8081/repository/raw-mydumper/"
            }

            steps {
                script {
                    env.PACKAGE_NAME = 'sc-mydumper-latest.tar.gz'
                }

                sh 'cmake .'
                sh 'make'
                sh 'make archive'
            }

            post {
                success {
                    sh "curl \
                        -u ${env.NEXUS_CREDENTIALS_USR}:${env.NEXUS_CREDENTIALS_PSW}  \
                        --upload-file ${env.PACKAGE_NAME} \
                        ${env.NEXUS_REPO_URI}"
                }
            }
        }
    }
}
