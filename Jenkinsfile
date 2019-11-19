pipeline {
  agent any

  stages {
      // checkout the terragrunt configuration from git repository. TG config files reference the terraform modules from git directly.
      stage ('git') {
          steps {
                  checkout(
                      [$class: 'GitSCM', 
                       branches: [[name: 'refs/tags/v0.0.1']], // checkout a specific branch, can be a branch name (eg, feature_ALB) or a specific tag (version tag).
                       doGenerateSubmoduleConfigurations: false, 
                       extensions: [], 
                       submoduleCfg: [], 
                       userRemoteConfigs: [[url: 'https://github.com/andrewCluey/tf-config.git']]
                       ]
                   )
           }
       }
      
      // run terragrunt plan-all within a docker image. # ADD Input Variable for Docker image version tag.
      stage('tg-plan') {
          agent {
              docker { 
                  image 'terragrunt:0.21.6' // name of the docker image and tag (imagename:tag).
                  args '-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v /var/lib/cloudbees-jenkins-distribution/workspace/tf-test2:/data -w /data/$Team'
              }
          }
          steps {
              sh 'terragrunt plan-all --terragrunt-source-update --terragrunt-non-interactive'
          }
      }
        
      // manual step to approve the terraform plan.  
      stage('approval') {
          steps {
              input 'Approve the plan to proceed.'
          }
      }

      // run terragrunt apply-all within a docker image.
      stage('tg-apply') {
            agent {
                docker { 
                  image 'terragrunt:0.21.6' // name of the docker image and tag (imagename:tag).
                  args '-e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v /var/lib/cloudbees-jenkins-distribution/workspace/tf-test2:/data -w /data/$Team'
                }
            }
            steps {
                sh 'terragrunt apply-all --terragrunt-source-update --terragrunt-non-interactive'
            }
        }

    }
}
