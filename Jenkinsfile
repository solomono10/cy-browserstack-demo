node {
    stage('Example') {
      withCredentials([string(credentialsId: 'BROWSERSTACK_USER', variable: 'browserstack_username'), string(credentialsId: 'BROWSERSTACK_KEY', variable: 'browserstack_key')]) {
        def browserStackProps = readJSON file: './browserstack.json'
        browserStackProps.auth.username = "${browserstack_username}" as String
        browserStackProps.auth.access_key = "${browserstack_key}" as String
        writeJSON file: 'browserstack.json', json: browserStackProps
        // echo "${browserStackProps.auth.username}"
        // echo "${browserStackProps.auth.access_key}"

        // echo "****************************"
        // echo "${browserstack_username}"
        // echo "****************************"
          // some block
      }
        // if (env.BRANCH_NAME == 'master') {
        //     echo 'I only execute on the master branch'
        // } else {
        //     echo 'I execute elsewhere'
        //     def browserStackProps = readJSON file: 'browserstack.json'
        //     echo "----------------------------"
        //     browserStackProps.auth.username = "${BUILD_NUMBER}"
        //     browserStackProps.auth.access_key = "${BROWSER}"
        //     writeJSON file: 'browserstack.json', json: browserStackProps
        //     echo "${browserStackProps.auth.username}"
        //     echo "${browserStackProps.auth.access_key}"
        //     echo "++++++++++++++++++++++++++++"
        // }
    }
}

pipeline {

  agent any

  tools {nodejs "node"}

  stages {
    // stage('Read-JSON') {
    //   steps {
    //     script {
    //       def oldJson = '''{
    //         "branch":{
    //           "type-0.2":{"version":"0.2","rc":"1","rel":"1","extras":"1"},
    //           "type-0.3":{"version":"0.3","rc":"1","rel":"1","extras":"1"}
    //           }
    //         }'''
    //         def props = readJSON text: oldJson
    //         def keyList = props['branch'].keySet()
    //         echo "${keyList}"
    //         // println(props['branch'].keySet())

    //       }
    //   }
    // }

//     def data = readJSON text: '{}'
// data.a = "test: ${myVar}" as String
// writeJSON(file: 'message1.json', json: data, pretty: 4)




    // stage('Read-JSON') {
    //   steps {
    //     script {
    //         def browserStackProps = readJSON file: 'browserstack.json'
    //         echo "----------------------------"
    //         browserStackProps.auth.username = "${BUILD_NUMBER}" as String
    //         browserStackProps.auth.access_key = "${BROWSER}" as String
    //         writeJSON file: 'browserstack.json', json: browserStackProps
    //         echo "${browserStackProps.auth.username}"
    //         echo "${browserStackProps.auth.access_key}"
    //         echo "++++++++++++++++++++++++++++"
    //       }
    //   }
    // }

    stage('dependencies') {
      steps {
        // props = readJSON file: "${env.WORKSPACE}\\browserstack.json"
        // // assert props['disable_usage_reporting'] == false
        // echo "----------------------------"
        // echo "${props['disable_usage_reporting']}"
        // echo "++++++++++++++++++++++++++++"
        // assert props.attr1 == 'One'
        echo "Running build ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh 'npm install -g browserstack-cypress-cli'
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
  post {
    always {
      mail to: 'notify-list@example.com', from: 'jenkins@example.com',
                subject: "Example Build: ${env.JOB_NAME} - Failed",
                body: "Job Failed - \"${env.JOB_NAME}\" build: ${env.BUILD_NUMBER}\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}"

      echo "Attach report to Browserstack"
    }
  }
}

// Credentials Binding Plugin
// https://www.jenkins.io/doc/book/pipeline/syntax/#script
// https://github.com/jenkinsci/generic-webhook-trigger-plugin/issues/107
// https://docs.cloudbees.com/docs/cloudbees-ci/latest/cloud-secure-guide/injecting-secrets
// https://gist.github.com/teeks99/d7c331b3f66a9fe6507cfdaaabbd9229

// https://www.browserstack.com/docs/automate/selenium/jenkins#JenkinsUI
// https://www.browserstack.com/guide/continuous-integration-with-jenkins-tutorial

// https://www.rubix.nl/blogs/jenkins-working-with-credentials-in-your-pipeline/
// https://stackoverflow.com/questions/53178146/how-to-get-password-from-a-credentials-parameter-in-jenkins-pipeline-job
// https://medium.com/@gustavo.guss/how-to-do-post-build-in-jenkins-pipeline-d1e7233909b8

// https://www.nuomiphp.com/eplan/en/398192.html
// https://tomd.xyz/jenkins-env-vars/
// https://code-maven.com/jenkins-pipeline-environment-variables
// https://www.codurance.com/publications/2019/05/30/accessing-and-dumping-jenkins-credentials
// https://emilwypych.com/2017/05/28/how-to-create-credentials-in-jenkins/