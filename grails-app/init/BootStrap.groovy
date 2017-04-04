import au.com.ts4impact.madcow.test.site.domain.PostCodeReference
import au.com.ts4impact.madcow.test.site.domain.State
import grails.util.GrailsUtil
import groovy.sql.Sql
import grails.util.Holders.*

//import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH
//import org.codehaus.groovy.grails.commons.ApplicationHolder
//import grails.util.Holders.*

class BootStrap {

    def grailsApplication

    def init = { servletContext ->
        switch(GrailsUtil.environment){
            case "development":
                println "#### Development Mode (Start Up) ####"
                //if no state data then pre populate DB
                if (!State.count()) {
                    createData();
                }
                //if no postcode data then pre populate it too
                if (!PostCodeReference.count()){
                    runStartUpSql(servletContext);
                }
                break
            case "test":
                println "#### Test Mode (Start Up) ####"
                break
            case "production":
                println "#### PRODUCTION Mode (Start Up) ####"
                //if no state data then pre populate DB
                if (!State.count()) {
                    createData();
                }
                //if no postcode data then pre populate it too
                if (!PostCodeReference.count()){
                    runStartUpSql(servletContext);
                }
                break
        }

    }
    def destroy = {
        switch(GrailsUtil.environment){
            case "development":
                println "#### Development Mode (Shut Down) ####"
                break
            case "test":
                println "#### Test Mode (Shut Down) ####"
                break
            case "production":
                println "#### PRODUCTION Mode (Shut Down) ####"
                break
        }
    }

    private void runStartUpSql(def servletContext) {

        println("Running Database preload start up SQL script");

        String sqlFilePath = servletContext.getRealPath("/conf/startUp.sql")
        def sqlStringLoop = new File(sqlFilePath).readLines()
        Sql sql = Sql.newInstance(grailsApplication.config.dataSource.url, grailsApplication.config.dataSource.username,
                grailsApplication.config.dataSource.password, grailsApplication.config.dataSource.driverClassName)
        sqlStringLoop.each { it ->
            sql.execute(it);
        }
        println("Finished Running Database preload start up SQL script")

    }

    private void createData() {

        println("Starting to add States")

        //adding states
        [1: [ shortName: 'NT',
              longName:  'Northern Territory'],
         2: [ shortName: 'NSW',
              longName:  'New South Wales'],
         3: [ shortName: 'ACT',
              longName:  'Australian Capital Territories'],
         4: [ shortName: 'VIC',
              longName:  'Victoria'],
         5: [ shortName: 'QLD',
              longName:  'Queensland'],
         6: [ shortName: 'SA',
              longName:  'South Australia'],
         7: [ shortName: 'WA',
              longName:  'Western Australia'],
         8: [ shortName: 'TAS',
              longName:  'Tasmania']
        ].each{stateId, dataMap ->

            def state = new State(  id: stateId,
                    shortName: dataMap.shortName,
                    longName : dataMap.longName).save(flush: true, failOnError:true);
        }

        println("Completed Adding States")

    }
}
