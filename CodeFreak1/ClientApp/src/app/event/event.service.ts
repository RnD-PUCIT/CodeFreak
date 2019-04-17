import { Injectable } from '@angular/core';
import { AppSettings } from '../AppSetting';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { CodeFreakHeaders } from '../Interceptors/CodeFreakHeaders';
import { EventViewModel } from './dtos/event-view-model';
import { EventUserViewModel } from './dtos/event-user-view-model';
import { EventProblemsViewModel } from './dtos/event-problems-view-model';
import { ProblemCompleteViewModel } from '../problem/dtos/problem-complete-view-model';
import { CompleteSubmissionViewModel } from '../problem/dtos/complete-submission-view-model';
import { UserInfoViewModel } from '../Security/Dtos/user-info-view-model';
import { ToastService } from '../toast/toast.service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class EventService {
  private baseUrl: string = AppSettings.baseUrl;
  private handlerUrl: string = AppSettings.eventURl;
  private problemHandlerUrl: string = AppSettings.problemURl;
  private addEventUrl: string = `addEvent`;
  private getEventyIdUrl: string = `getEvent`;
  private addEventProblemUrl: string = `addEventProblem`;
  private getEventProblemsUrl: string = `getEventProblems`;
  private removeEventProblemsUrl: string = `deleteEventProblem`;
  private getEventSubmissionsUrl: string = `getEventSubmissions`;
  private addEventUserUrl:string=`addEventUser`;
  private getEventUsersUrl = `getEventUsers`;
  private removeEventUserUrl = `removeEventUser`;


  constructor(private http: HttpClient, private route: Router, private toast: ToastService) { }
  addEvent(eve): Observable<EventViewModel> {
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.addEventUrl}`;
    var res = this.http.post<EventViewModel>(url, JSON.stringify(eve), httpOptions).pipe(
      tap((cre: EventViewModel) => this.log(`added employee w/ Success=${cre.Success}`)),
      catchError((error: HttpErrorResponse)=>this.handleError<EventViewModel>(error)));
    return res;
  }
  getEventById(id): Observable<EventUserViewModel> {
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.getEventyIdUrl}?eventId=${id}`;
    var res = this.http.get<EventUserViewModel>(url, httpOptions).pipe(
      tap((cre: EventUserViewModel) => this.log(`added employee w/ Success=${cre.Success}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<EventUserViewModel>(error)));
    return res;
  }


  addEventProblem(eveProb): Observable<EventProblemsViewModel> {
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.addEventProblemUrl}`;
    var res = this.http.post<EventProblemsViewModel>(url, JSON.stringify(eveProb), httpOptions).pipe(
      tap((cre: EventProblemsViewModel) => this.log(`added employee w/ Success=${cre.Success}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<EventProblemsViewModel>(error)));
    return res;
  }
  removeEventProblem(eveProb): Observable<EventProblemsViewModel> {
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.removeEventProblemsUrl}`;
    var res = this.http.post<EventProblemsViewModel>(url, JSON.stringify(eveProb), httpOptions).pipe(
      tap((cre: EventProblemsViewModel) => this.log(`added employee w/ Success=${cre.Success}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<EventProblemsViewModel>(error)));
    return res;
  }

  getEventProblems(id): Observable<Array<ProblemCompleteViewModel>> {
    //    let httpOptions = CodeFreakHeaders.GetSimpleHeader();
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.getEventProblemsUrl}?eventId=${id}`;
    var res = this.http.get<Array<ProblemCompleteViewModel>>(url, httpOptions).pipe(
      tap((cre: Array<ProblemCompleteViewModel>) => this.log(`added employee w/ Success=${cre.length}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<Array<ProblemCompleteViewModel>>(error)));
    return res;
  }
  getEventSubmissions(id): Observable<Array<CompleteSubmissionViewModel>> {
    //    let httpOptions = CodeFreakHeaders.GetSimpleHeader();
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.getEventSubmissionsUrl}?eventId=${id}`;
    var res = this.http.get<Array<CompleteSubmissionViewModel>>(url, httpOptions).pipe(
      tap((cre: Array<CompleteSubmissionViewModel>) => this.log(`added employee w/ Success=${cre.length}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<Array<CompleteSubmissionViewModel>>(error)));
    return res;
  }

  addEventUser(val): Observable<EventUserViewModel> {
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.addEventUserUrl}`;
    var res = this.http.post<EventUserViewModel>(url, JSON.stringify(val), httpOptions).pipe(
      tap((cre: EventUserViewModel) => this.log(`added employee w/ Success=${cre.Success}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<EventUserViewModel>(error)));
    return res;
  }

  getEventUser(id): Observable<Array<EventUserViewModel>> {
    //    let httpOptions = CodeFreakHeaders.GetSimpleHeader();
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.getEventUsersUrl}?eventId=${id}`;
    var res = this.http.get<Array<EventUserViewModel>>(url, httpOptions).pipe(
      tap((cre: Array<EventUserViewModel>) => this.log(`added employee w/ Success=${cre.length}`)),
      catchError((error: HttpErrorResponse) =>this.handleError<Array<EventUserViewModel>>(error)));
    return res;
  }

  removeEventUser(userId, eventId): Observable<UserInfoViewModel> {
    //    let httpOptions = CodeFreakHeaders.GetSimpleHeader();
    let httpOptions = {
      headers: new HttpHeaders({ 'Authorization': 'Bearer ' + localStorage.getItem('token'), 'Content-Type': 'application/json' })
    };
    httpOptions.headers.append('Content-Type', 'application/json');
    httpOptions.headers.append('Accept', 'application/json');
    httpOptions.headers.append('Authorization', `bearer ${localStorage.getItem('token')}`);

    let url = `${this.baseUrl}${this.handlerUrl}${this.removeEventUserUrl}?eventId=${eventId}&userId=${userId}`;
    var res = this.http.get<UserInfoViewModel>(url, httpOptions).pipe(
      tap((cre: UserInfoViewModel) => this.log(`added employee w/ Success=`)),
      catchError((error: HttpErrorResponse) =>this.handleError<UserInfoViewModel>(error)));
    return res;
  }




  private handleError<T>(error: HttpErrorResponse, result?: T) {
    debugger;
    if (error.status == 401) {
      this.toast.makeError("Please login", "");
      this.route.navigate(['login']);
      return;
    }
    return Observable.throw(error);

  }
  private log(message: string) {
    console.log(message);
  }

}