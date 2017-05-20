import {Component} from '@angular/core';
import {OnInit} from "@angular/core";

import {DataStore} from 'js-data';
import {HttpAdapter} from 'js-data-http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'feathers';

  messages: any[];
  message: any;
  private store: DataStore;

  constructor() {
    this.makeMessage();

    const store = new DataStore();
    const httpAdapter = new HttpAdapter();

    store.registerAdapter('http', httpAdapter, {'default': true});

    store.defineMapper('messages');

    this.store = store;
  }

  private makeMessage() {
    this.message = {
      text: ''
    }
  }

  ngOnInit(): void {
    this.loadMessages();
  }

  private loadMessages() {
    this.store.findAll('messages', {}, {force: true})
      .then((messages) => {
        this.messages = messages;
      });
  }

  save() {
    this.store.create('messages', this.message)
      .then(() => this.makeMessage())
      .then(() => this.loadMessages())
  }

  remove(message) {
    this.store.destroy('messages', message._id)
      .then(() => this.loadMessages());
  }
}
