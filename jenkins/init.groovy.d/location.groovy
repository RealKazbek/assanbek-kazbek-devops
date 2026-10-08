import jenkins.model.JenkinsLocationConfiguration

JenkinsLocationConfiguration.get().setUrl('http://127.0.0.1:8082/')
JenkinsLocationConfiguration.get().save()
