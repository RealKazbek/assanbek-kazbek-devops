import hudson.security.FullControlOnceLoggedInAuthorizationStrategy
import hudson.security.HudsonPrivateSecurityRealm
import jenkins.model.Jenkins

def instance = Jenkins.get()
def adminId = System.getenv('JENKINS_ADMIN_ID')
def adminPassword = System.getenv('JENKINS_ADMIN_PASSWORD')

if (adminId && adminPassword && instance.getSecurityRealm().getClass() == HudsonPrivateSecurityRealm.class) {
    def realm = instance.getSecurityRealm()
    if (realm.getUser(adminId) == null) {
        realm.createAccount(adminId, adminPassword)
    } else {
        realm.getUser(adminId).addProperty(HudsonPrivateSecurityRealm.Details.fromPlainPassword(adminPassword))
    }
}

if (adminId && adminPassword) {
    instance.setSecurityRealm(new HudsonPrivateSecurityRealm(false))
    def realm = instance.getSecurityRealm()
    if (realm.getUser(adminId) == null) {
        realm.createAccount(adminId, adminPassword)
    } else {
        realm.getUser(adminId).addProperty(HudsonPrivateSecurityRealm.Details.fromPlainPassword(adminPassword))
    }
    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    strategy.setAllowAnonymousRead(false)
    instance.setAuthorizationStrategy(strategy)
    instance.save()
}
