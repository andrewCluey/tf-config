pipeline {
  agent {
    docker {
      image 'cytopia:terragrunt'
    }

  }
  stages {
    stage('plan') {
      steps {
        sh '''docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \\
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \\
                -v /team2:/data -w /data cytopia/terragrunt terragrunt plan-all --terragrunt-source-update --terragrunt-non-interactive'''
      }
    }
    stage('approval') {
      steps {
        input 'approve the plan to proceed and apply'
      }
    }
    stage('apply') {
      steps {
        sh '''docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \\
                    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \\
                    -v /team2:/data -w /data/ cytopia/terragrunt terragrunt apply --terragrunt-source-update --terragrunt-non-interactive'''
      }
    }
  }
}