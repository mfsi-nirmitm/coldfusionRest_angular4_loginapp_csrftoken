import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './core/header/header.component';
import { AuthService } from './auth/auth.service';
import { AuthModule } from './auth/auth.module';
import { DataStorageService } from './shared/data-storage.service';
import { SharedModule } from './shared/shared.module';
import { RecipesComponent } from './recipes/recipes.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    RecipesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    AuthModule,
    HttpClientModule,
    SharedModule
  ],
  exports: [RecipesComponent],
  providers: [
    AuthService,
    DataStorageService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
