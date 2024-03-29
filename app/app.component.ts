import { Component } from '@angular/core';

import { AuthService } from './auth/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';
 
  constructor(private authService: AuthService) { 
	  if( localStorage.getItem('token') != null ) {
	  	this.authService.token = localStorage.getItem('token');
	  }
  }


}
