
pipeline {

  agent any

  tools {nodejs "node"}

  stages {

    stage('dependencies') {
      steps {
        props = readJSON file: "${env.WORKSPACE}\\browserstack.json"
        // assert props['disable_usage_reporting'] == false
        echo "----------------------------"
        echo '${props['disable_usage_reporting']}'
        echo "++++++++++++++++++++++++++++"
        // assert props.attr1 == 'One'
        echo "Running build ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh 'npm ci'
        sh 'npm run cy:verify'
        sh 'npm run cy:info'
      }
    }

    stage('e2e tests') {
      steps {
        echo "Running build ${env.BUILD_ID}"
        sh 'chmod +x ./script.sh'
        sh './script.sh $PAGE $FEATURE_FILES $BROWSER'
      }
    }
  }
}