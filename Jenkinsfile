
pipeline {

  agent any

  tools {nodejs "node"}

  stages {

    stage('dependencies') {
      steps {
        echo "Running build ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh 'npm ci'
        sh 'npm run cy:verify'
      }
    }

    stage('e2e tests') {
      steps {
        echo "Running build ${env.BUILD_ID}"
        sh "./script.sh $PAGE $FEATURE_FILES"
      }
    }
  }
}