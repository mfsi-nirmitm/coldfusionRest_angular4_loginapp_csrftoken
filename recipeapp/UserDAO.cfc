<!---
  --- UserDAO
  --- -------
  ---
  --- author: mindfire
  --- date:   12/13/17
  --->
<cfcomponent name="UserDAO" output="false" hint="Data Access Layer for User">

	<cfset variables.DSN = "" />
	<cffunction name="init" access="public" output="false" returnType="UserDAO" hint="constructor" >
		<cfset variables.DSN = "recipeapp" />
		<cfreturn this />
	</cffunction>

	<!--- checking user credentials in database ---->
	<cffunction
				name="loginAuthentication"
				access="public"
				output="false"
				returnType="boolean"
				hint="login authentication function">
		<cfargument name="userName" required="true" type="string" hint="userName of user" />
		<cfargument name="password" required="true" type="string" hint="password of user" />

		<cfset local.isLogin = false />
		<cfquery name="qLogin" datasource= "#variables.DSN#" >
			SELECT *
			FROM USERS
			WHERE USERNAME = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar" />
			AND PASSWORD = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qLogin.recordCount EQ 1 >
			<cfset local.isLogin = true />
		</cfif>
		<cfreturn local.isLogin />
	</cffunction>

	<!--- checking weather username for new user is available or not --->
	<cffunction
				name="checkUser"
				access="public"
				output="false"
				returnType="boolean"
				hint="check username exists or not">
		<cfargument name="userName" required="true" type="string" hint="userName of user" />
		<cfset local.isValid = true />
		<cfquery name="qUserName" datasource="#variables.DSN#">
			SELECT *
			FROM USERS
			WHERE USERNAME = <cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qUserName.recordCount EQ 0 >
			<cfset local.isValid = true />
		<cfelse >
			<cfset local.isValid = false />
		</cfif>

		<cfreturn local.isValid />
	</cffunction>

	<!--- checking email is already in database or not --->
	<cffunction
				name="checkUserEmail"
				access="public"
				output="false"
				returnType="boolean"
				hint="check username exists or not">
		<cfargument name="userEmail" required="true" type="string" hint="userName of user" />
		<cfset local.isValid = true />
		<cfquery name="qUserEmail" datasource="#variables.DSN#">
			SELECT *
			FROM USERS
			WHERE EMAILID = <cfqueryparam value="#arguments.userEmail#" cfsqltype="cf_sql_varchar" />
		</cfquery>

		<cfif qUserEmail.recordCount EQ 0 >
			<cfset local.isValid = true />
		<cfelse >
			<cfset local.isValid = false />
		</cfif>

		<cfreturn local.isValid />
	</cffunction>

	<!--- adding new user details into database --->
	<cffunction
				name="addUser"
				access="remote"
				output="false"
				returnType="void"
				hint="adding user detail in database">
		<cfargument name="firstName" required="true" type="string" />
		<cfargument name="lastName" required="true" type="string" />
		<cfargument name="userName" required="true" type="string" />
		<cfargument name="email" required="true" type="string" />
		<cfargument name="password" required="true" type="string" />
		<cfargument name="isAdmin" required="false" type="numeric" default="0" />

		<cfquery  datasource="#variables.DSN#">
			INSERT INTO USERS
			VALUES(
				<cfqueryparam value="#arguments.firstName#" cfsqltype="cf_sql_varchar" /> ,
				<cfqueryparam value="#arguments.lastName#" cfsqltype="cf_sql_varchar" /> ,
				<cfqueryparam value="#arguments.userName#" cfsqltype="cf_sql_varchar" /> ,
				<cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" /> ,
				<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" /> ,
				<cfqueryparam value="#arguments.isAdmin#" cfsqltype="cf_sql_bit" />
			)
		</cfquery>

	</cffunction>
</cfcomponent>