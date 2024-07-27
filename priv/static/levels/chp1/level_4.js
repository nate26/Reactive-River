
import { Observable } from 'rxjs';

// TODO: Implement the error case, where Franky falls in the river.

// Franky Jump
const jump = () => console.log('Franky: Jump!');

// Franky Celebrate
const fall = () => console.log('Franky: Fall!');

const river = new Observable(observer => {
    observer.next('lily_pad');
    observer.next('lily_pad');
    observer.error('oil_spill');
});

// Change the code below
river.subscribe(console.log);
