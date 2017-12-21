import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from './auth/auth-guard.service';
import { RecipesComponent } from './recipes/recipes.component';

const appRoutes: Routes = [
	{ path: '', redirectTo: '/signin', pathMatch: 'full' },
	{ path: 'recipes', component : RecipesComponent , canActivate: [AuthGuard] }
];

@NgModule({
	imports: [
		RouterModule.forRoot(appRoutes)
	],
	exports: [RouterModule],
	providers: [
		AuthGuard
	]
})
export class AppRoutingModule {
	
}