TOOLS_IMAGE = 'dga-tools:latest'
TOOLS_ARGS = '--volume /var/run/docker.sock:/var/run/docker.sock --network host --volume /tmp:/tmp'

pipeline {
    agent none
    triggers {
        pollSCM( '* * * * *')
    }

    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }

    stages {
        stage('Hello') {

            steps {
                echo "World"
            }
        }
    }

}
