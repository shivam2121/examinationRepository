component hint="This Application" {
    
    this.name = hash(getCurrentTemplatePath());
    this.loginStorage = "session";
	this.sessionTimeout = createtimespan( 0, 10, 0, 0 );
	this.applicationTimeout = createtimespan( 0, 0, 0, 0);
    this.requestTimeout = createTimeSpan( 0, 0, 1, 0 );
    
    this.datasources["shivamart"] = {
        class: 'com.mysql.cj.jdbc.Driver'
        , bundleName: 'com.mysql.cj'
        , bundleVersion: '8.0.15'
        , connectionString: 'jdbc:mysql://localhost:3306/shivamart?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Calcutta&allowMultiQueries=true&useLegacyDatetimeCode=true'
        , username: 'root'
        , password: "encrypted:d014e33ef5c34fa9e4b5d155d4ef2fbf18e0d520fee0f678"
        
        // optional settings
        , connectionLimit:100 // default:-1
        , storage:true // default: false
        , alwaysSetTimeout:true // default: false
    };

    function onApplicationStart() {
        // all the APPLICATION variables declaration goes here
        application.dsn = "shivamart";
        application.uid = "root";
        application.pwd = "root";

    }
    
    function onRequestStart(required targetPage) {
        
    }    
    
    function onRequest(targetPage) {     
        structAppend(form, URL);  
        include template="#arguments.targetPage#";
    }
    
    function onError(exception,eventname) {
        dump(arguments);
        /* savecontent  variable="Error"
        {
            writeOutput("Error Occured!!");
            writeOutput(exception.message);
            writeOutput(exception.type);
            writeOutput(eventname);
        }
        fileWrite(expandPath("./error.html"), "#Error#"); */
    }
    

    // below functions are less used

    function onRequestEnd() {
    }

    function onApplicationEnd() {
    }

    function onSessionStart() {
    }

    function onSessionEnd() {
    }
}