import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

import { SigninComponent } from './signin/signin.component';
import { SignupComponent } from './signup/signup.component';
import { AuthRoutingModule } from './auth-routing.module';

@NgModule({
	declarations: [
		SigninComponent,
		SignupComponent
	],
	imports: [
		CommonModule,
		ReactiveFormsModule,
		AuthRoutingModule
	],
	exports: [
		
	]
})
export class AuthModule {}