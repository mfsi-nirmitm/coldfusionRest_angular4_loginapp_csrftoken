import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { AuthService } from '../auth.service';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.css']
})
export class SignupComponent implements OnInit {
  registerForm: FormGroup;
  passwordError: string = "Enter confirm password!";
  userNameError: string = "Enter username!";
  userEmailError:string = "Enter email address!";

  constructor(private authService: AuthService) { }

  ngOnInit() {
  	this.registerForm = new FormGroup({
  		'userData' : new FormGroup({
  			'first_name' : new FormControl(null, [Validators.required,]),
  			'last_name'  : new FormControl(null, [Validators.required]),
  			'user_name'  : new FormControl(null, [Validators.required,Validators.minLength(3)]),
  			'email'      : new FormControl(null, [Validators.required,Validators.email]),
  			'password'   : new FormControl(null, [Validators.required,Validators.pattern(/^(?=.*\d)[a-zA-Z\d]{4,}$/)]),
  			'confirm_password' : new FormControl(null, [Validators.required])
  		},[this.passwordMatchValidator.bind(this),this.userNameValidator.bind(this),this.userEmailValidator.bind(this)])
  	});
  }

  userEmailValidator(g:FormGroup) {
    if( !this.authService.checkUserEmail( g.get('email').value ) ) {
      g.get('email').setErrors({invalid:true});
      this.userEmailError = "this email is already registered!";
    }
    else if( g.get('email').value != "" ) {
      g.get('email').setErrors(null);
      this.userEmailError = "Please enter a email address!";
    }
  }

  userNameValidator(g:FormGroup) {
    //console.log( this.authService.checkUserName( g.get('user_name').value ) );
    if( !this.authService.checkUserName( g.get('user_name').value ) ) {
      g.get('user_name').setErrors({'invalid':true});
      this.userNameError = "This username is not available!";
    } 
    else if( g.get('user_name').value != "" ) {
      g.get('user_name').setErrors(null);
      this.userNameError = "Please enter username!";
    }
  }

  passwordMatchValidator(g:FormGroup) {
  	if(!(g.get('password').value === g.get('confirm_password').value)) {
  		g.get('confirm_password').setErrors({invalid:true});
      this.passwordError = "Password shold be same!";
  	}
    else if(g.get('confirm_password').value != ""){
      g.get('confirm_password').setErrors(null);
      this.passwordError = "Re-Enter password!";
    }
  }  

  onSubmit() {
    //console.log(this.registerForm.value.userData.first_name);
    this.authService.addUser(
                              this.registerForm.value.userData.first_name,
                              this.registerForm.value.userData.last_name,
                              this.registerForm.value.userData.user_name,
                              this.registerForm.value.userData.email,
                              this.registerForm.value.userData.password
    );
  }

}
