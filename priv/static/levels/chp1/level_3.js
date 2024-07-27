
import { Observable } from 'rxjs';

// TODO: Instead of logging each item, tell Franky when to jump or celebrate.

// Franky Jump
const jump = () => console.log('Franky: Jump!');

// Franky Celebrate
const celebrate = () => console.log('Franky: Done!');

const river = new Observable(observer => {
    observer.next('lily_pad');
    observer.next('lily_pad');
    observer.next('lily_pad');
    observer.complete();
});

// Change the code below
river.subscribe(console.log);
