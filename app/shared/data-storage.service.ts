import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpRequest } from '@angular/common/http';

@Injectable()
export class DataStorageService {
	constructor( private httpClient: HttpClient ) {  }

	validateLoginAction(userName: string, password: string) {
		const body = '{"userName":"'+userName+'","password" :"'+password+'"}';
		//const req = new HttpRequest('POST','http://localhost/rest/recipeapp/user/login',body);
		//return this.httpClient.request(req);

		return this.httpClient.post<{access: boolean , token: string}>('http://localhost/rest/recipeapp/user/login',body);
	}

	checkUserName(userName: string) {
		return this.httpClient.get<{isValid: boolean}>('http://localhost/rest/recipeapp/user/checkUser?userName='+userName);
	}

	checkUserEmail(userEmail: string) {
		return this.httpClient.get<{isValid: boolean}>('http://localhost/rest/recipeapp/user/checkEmail?userEmail='+userEmail);
	}

	addUser(firstName:string, lastName:string, userName:string,email:string,password:string) {
		const body = '{"firstName" : "'+firstName+'","lastName":"'+lastName+'","userName":"'+userName+'","email":"'+email+'","password":"'+password+'"}';
		const headers = new HttpHeaders().set('Content-Type', 'application/json')
										 .set('responseType', 'application/json');
		//console.log(body);
		return this.httpClient.post('http://localhost/rest/recipeapp/user/addUser',body,{headers:headers});
	}
}