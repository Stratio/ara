@Library('libpipelines@master') _


hose {
    EMAIL = 'eos@stratio.com'
    BUILDTOOL_IMAGE = 'stratio/ara-builder:0.1.0'
    BUILDTOOL = 'make'
    DEVTIMEOUT = 30
    DEPLOYONPRS = true
    ANCHORE_TEST = true
    VERSIONING_TYPE = 'stratioVersion-3-3'
    UPSTREAM_VERSION = '1.5.7'
    SKIPONPR = false

    DEV = { config ->
        doPackage(config)
        def SKIPONPR = false
        doDocker(conf: config, dockerfile: "rootfs/Dockerfile.stratio")
        doHelmChart(conf: config, helmTarget: "chart")
    }
}
