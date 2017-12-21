<!---
  --- Application
  --- -----------
  ---
  --- author: mindfire
  --- date:   12/13/17
  --->
<cfcomponent accessors="true" output="false" persistent="false">

	<cfset this.name="recipeapp" />
	<!---<cfset this.restsettings.skipCFCWithError = true />--->
	<cfset this.datasource= "recipeapp">
	<cfset this.serialization.preservecaseforstructkey = true />
	<!---enabling session--->
	<cfset this.sessionManagement = true />

	<!---creating a time stamp for session--->
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />

	<!---OnApplicationStart() method--->
	<cffunction name="onApplicationStart" returntype="boolean" >
		<!--- creating object to access functions  --->
		<cfset application.userDAO = createObject("component",'UserDAO').init() />

		<cfreturn true />
	</cffunction>

	<!---onRequestStart() method--->
	<cffunction name="onRequestStart" returntype="boolean" hint = "function execute at request time">

		<!---checking weather restartApp in url exists or not--->
		<cfif isDefined('url.restartApp')>

			<!---restarting the application--->
			<cfset this.onApplicationStart() />
		</cfif>
		<cfreturn true />
	</cffunction>

</cfcomponent>