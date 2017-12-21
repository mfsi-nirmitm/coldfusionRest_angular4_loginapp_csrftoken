<!---
  --- User
  --- ----
  ---
  --- author: mindfire
  --- date:   12/13/17
  --->
<cfcomponent name="User" hint="This is an User DTO" >

	<cfset variables.instance.userId = 0 />
	<cfset variables.instance.firstName = "" />
	<cfset variables.instance.lastName = "" />
	<cfset variables.instance.userName = ""  />
	<cfset variables.instance.emailId = "" />
	<cfset variables.instance.password = ""  />
	<cfset variables.instance.admin = 0  />

	<cffunction name="init" access="public" output="false" returnType="User" hint="constructor for user dto" >
		<cfargument name="userId" type="numeric" required="false" default="0" hint="UserId" />
		<cfargument name="firstName" type="string" required="false" default="" hint="FirstName" />
		<cfargument name="lastName" type="string" required="false" default="" hint="LastName" />
		<cfargument name="userName" type="string" required="false" default="" hint="UserName" />
		<cfargument name="emailId" type="string" required="false" default="" hint="EmailId" />
		<cfargument name="password" type="string" required="false" default="" hint="Password" />
		<cfargument name="admin" type="numeric" required="false" default="0" hint="Admin:1 & User:0">

		<cfset setUserId(arguments.userId) />
		<cfset setFirstName(arguments.firstName) />
		<cfset setLastName(arguments.lastName) />
		<cfset setUserName(arguments.userName) />
		<cfset setEmailId(arguments.emailId) />
		<cfset setPassword(arguments.password) />
		<cfset setAdmin(arguments.admin) />
	</cffunction >

	<cffunction name="getUserId" access="public" output="false" returnType="numeric" hint="Getter for User Id" >
		<cfreturn variables.instance.userId />
	</cffunction >

	<cffunction name="setUserId" access="private" output="false" returnType="void" hint="Setter of User Id">
		<cfargument name="userId" required="true" type="numeric" hint="userId" />
		<cfset variables.instance.userId = arguments.userId />
	</cffunction>

	<cffunction name="getFirstName" access="public" output="false" returnType="string" hint="Getter of firstName">
		<cfreturn variables.instance.firstName />
	</cffunction>

	<cffunction name="setFirstName" access="private" output="false" returnType="void" hint="Setter of firstName">
		<cfargument name="firstName" required="true" type="string" hint="firstName" />
		<cfset variables.instance.lastName = arguments.firstName />
	</cffunction>

	<cffunction name="getLastName" access="public" output="false" returnType="string" hint="Getter of lastName">
		<cfreturn variables.instance.lastName />
	</cffunction>

	<cffunction name="setLastName" access="private" output="false" returnType="void" hint="Setter of lastName">
		<cfargument name="lastName" required="true" type="string" hint="lastName" />
		<cfset variables.instance.lastName = arguments.lastName />
	</cffunction>

	<cffunction name="getUserName" access="public" output="false" returnType="string" hint="Getter of userName">
		<cfreturn variables.instance.userName />
	</cffunction>

	<cffunction name="setUserName" access="private" output="false" returnType="void" hint="Setter of userName">
		<cfargument name="userName" required="true" type="string" hint="userName" />
		<cfset variables.instance.userName = arguments.userName />
	</cffunction>

	<cffunction name="getEmailId" access="public" output="false" returnType="string" hint="Getter of emailId" >
		<cfreturn variables.instance.emailId />
	</cffunction >

	<cffunction name="setEmailId" access="private" output="false" returnType="void" hint="Setter of emailId">
		<cfargument name="emailId" required="true" type="string" hint="emailId" />
		<cfset variables.instance.emailId = arguments.emailId />
	</cffunction >

	<cffunction name="getPassword" access="public" output="false" returnType="string" hint="Getter of password" >
		<cfreturn variables.instance.password />
	</cffunction >

	<cffunction name="setPassword" access="private" output="false" returnType="void" hint="Setter of password">
		<cfargument name="password" required="true" type="string" hint="password" />
		<cfset variables.instance.password = arguments.password />
	</cffunction >

	<cffunction name="getAdmin" access="public" output="false" returnType="string" hint="Getter of admin">
		<cfreturn variables.instance.admin />
	</cffunction>

	<cffunction name="setAdmin" access="private" output="false" returnType="void" hint="Setter of admin" >
		<cfargument name="admin" required="true" type="string" hint="admin" />
		<cfset variables.instance.admin = arguments.admin />
	</cffunction>
</cfcomponent>