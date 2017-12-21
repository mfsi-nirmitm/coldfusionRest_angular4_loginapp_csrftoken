import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { AuthService } from '../auth.service';

@Component({
  selector: 'app-signin',
  templateUrl: './signin.component.html',
  styleUrls: ['./signin.component.css'] 
})
export class SigninComponent implements OnInit { 
  loginForm: FormGroup;

  constructor(private authService: AuthService) { }
 
  ngOnInit() {
  	this.loginForm = new FormGroup({
  		'loginData' : new FormGroup({
  			'user_name' : new FormControl(null, [Validators.required]),
  			'password'  : new FormControl(null, [Validators.required])
  		})
  	});
  }

  onSubmit() {
  	if(!this.loginForm.invalid) {
      this.authService.validateLoginAction(
          this.loginForm.value.loginData.user_name ,
          this.loginForm.value.loginData.password  );
    }
  }

}
