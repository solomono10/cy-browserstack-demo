
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

    stage('Read-JSON') {
      steps {
        script {
            def browserStackProps = readJSON file: 'browserstack.json'
            echo "----------------------------"
            browserStackProps.auth.username = "jidex"
            browserStackProps.auth.access_key = "password"
            writeJSON file: 'browserstack.json', json: browserStackProps
            echo "${browserStackProps.auth.username}"
            echo "${browserStackProps.auth.access_key}"
            echo "++++++++++++++++++++++++++++"
          }
      }
    }

    stage('dependencies') {
      steps {
        // props = readJSON file: "${env.WORKSPACE}\\browserstack.json"
        // // assert props['disable_usage_reporting'] == false
        // echo "----------------------------"
        // echo "${props['disable_usage_reporting']}"
        // echo "++++++++++++++++++++++++++++"
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


// https://www.nuomiphp.com/eplan/en/398192.html
// https://tomd.xyz/jenkins-env-vars/