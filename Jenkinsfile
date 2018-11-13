node {
    def commit_id
    stage('get data from gitt '){
      checkout scm
      sh "git rev-parse --short HEAD > .git/commit-id"                        
      commit_id = readFile('.git/commit-id').trim()
    }
    stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("11davel/001-angular-jenkins01:${commit_id}", '.').push()
     }
   }
}
