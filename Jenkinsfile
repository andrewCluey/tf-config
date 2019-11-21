pipeline {
  agent any
  stages {
      stage ('git') {
          steps {
              checkout(
                      [$class: 'GitSCM', 
                       branches: [[name: '*/master']], // checkout a specific branch, can be a branch name (eg, feature_ALB) or a specific tag (version tag).
                       doGenerateSubmoduleConfigurations: false, 
                       extensions: [], 
                       submoduleCfg: [], 
                       userRemoteConfigs: [[url: 'https://github.com/andrewCluey/tf-config.git']]
                       ]
                   )
           }
       }
       
      stage('plan') {
          steps {
              catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                  sh '''docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \\
                  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \\
                  -v /var/lib/cloudbees-jenkins-distribution/workspace/tf:/config -w /config/$Team cluey36/terragrunt terragrunt plan-all --terragrunt-source-update --terragrunt-non-interactive'''
              }
          }
          
      }
      
      stage('approval') {
          steps {
              input 'approve the plan to proceed.'
          }
      }

      stage('apply') {
          steps {
              sh '''docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \\
                    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \\
                    -v /var/lib/cloudbees-jenkins-distribution/workspace/tf:/config -w /config/$Team cluey36/terragrunt terragrunt apply-all --terragrunt-non-interactive'''
          }
      }
      
  }
}
