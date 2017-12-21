import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

import { DataStorageService } from '../shared/data-storage.service';

@Injectable()
export class AuthService {
	token: string = null;
	isUserValid :boolean;
	isEmailValid : boolean;

	constructor(private dataStorageService: DataStorageService,
				private router : Router) {  }

	validateLoginAction(userName: string, password: string) {
		this.dataStorageService.validateLoginAction(userName,password)
			.subscribe(
				(response) => {
					console.log(response);
					if(response.access) {
						this.token = response.token;
						localStorage.setItem('token',this.token);
						this.router.navigate(['/recipes']);
					}
				}
			);
	}

	checkUserName(userName: string) {
		this.dataStorageService.checkUserName(userName)
			.subscribe(
				(response) => {
					//console.log(response);
					this.isUserValid = response.isValid;
				}
			);
		return this.isUserValid;
	}

	checkUserEmail(userEmail: string) {
		this.dataStorageService.checkUserEmail(userEmail)
			.subscribe(
				(response) => {
					this.isEmailValid = response.isValid;
				}
			);
		return this.isEmailValid;
	}

	addUser(firstName:string,lastName:string,userName:string,email:string,password:string) {
		this.dataStorageService.addUser(firstName,lastName,userName,email,password)
			.subscribe(
				(response) => {
					this.router.navigate(['/signin']);
				}
			);
	}

	isAuthenticated() {
		return this.token != null;
	}

}