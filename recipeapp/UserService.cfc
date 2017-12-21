<!---
  --- UserService
  --- -----------
  ---
  --- author: mindfire
  --- date:   12/13/17
  --->
<cfcomponent name="UserService" hint="service for users" restPath="user" produces="application/JSON" rest="true">

	<cffunction
				name="loginAuthentication"
				access="remote"
				output="true"
				returnType="any"
				HTTPMethod="POST"
				restPath="/login"
				description="method to verify user"	>

		<cfargument
					name="jsonData"
					required="true"
					type = "string"	/>

		<cfset local.data = deserializeJSON(arguments.jsonData) />
		<cfset local.isLogin = application.userDAO.loginAuthentication(local.data.userName,local.data.password)  />
		<cfset local.login_data = {} />
		<cfif local.isLogin >
			<cfset local.login_data['access'] = true  />
			<cfset local.login_data['token'] = generateToken() />
		<cfelse >
			<cfset local.login_data['access'] = false />
		</cfif>

		<cfreturn local.login_data />
	</cffunction>

	<cffunction
				name="addUser"
				access="remote"
				output="false"
				returnType="void"
				HTTPMethod="POST"
				restPath="/addUser"
				description="method to add user in database">

		<cfargument
			name="jsonData"
			required="true"
			type="string" />


		<cfset local.data = deserializeJSON(arguments.jsonData) />
		<!--- <cfreturn local.data /> --->
		<cfset application.userDAO.addUser(
											local.data.firstName,
											local.data.lastName,
											local.data.userName,
											local.data.email,
											local.data.password) />

	</cffunction >

	<!--- generate csrf token  --->
	<cffunction
				name="generateToken"
				access="private"
				output="false"
				returnType="string"
				description = "generating token"	>
		<cfreturn CSRFGenerateToken(true) />
	</cffunction>

<!---
	<cffunction
				name="checkUserName"
				access="remote"
				output="false"
				returnType="any"
				restpath="/checkUser"
				HTTPMethod="GET"
				description="check username is already exist or not">

		<cfargument
					name="jsonData"
					required="true"
					type="string" />
		<cfset local.data = deserializeJSON(arguments.jsonData) />
		<cfset local.isValid = !application.userDAO.checkUser(local.data.userName) />

		<cfreturn local.isValid />

	</cffunction>
--->

	<cffunction
				name="checkUserName"
				access="remote"
				output="false"
				returnType="any"
				restpath="/checkUser"
				HTTPMethod="GET"
				description="check username is already exist or not">

		<cfargument
					name="userName"
					required="true"
					restArgSource="query"
					type="string" />
		<cfset local.data = {} />
		<cfset local.data['isValid'] = application.userDAO.checkUser(arguments.userName) />
		<cfreturn local.data />
	</cffunction>

	<cffunction
				name="checkEmail"
				access="remote"
				output="false"
				returnType="any"
				restpath="/checkEmail"
				HTTPMethod="GET"
				description="check username is already exist or not">

		<cfargument
					name="userEmail"
					required="true"
					restArgSource="query"
					type="string" />
		<cfset local.data = {} />
		<cfset local.data['isValid'] = application.userDAO.checkUserEmail(arguments.userEmail) />
		<cfreturn local.data />
	</cffunction>


<!---
	<cffunction name="fun" access="remote" output="true" returnType="void" description="printing token to page" >
		<cfdump var =  "#generateToken()#" />
	</cffunction>
--->

</cfcomponent>