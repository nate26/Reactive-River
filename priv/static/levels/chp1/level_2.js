
import { Observable } from 'rxjs';

// TODO: Send 2 more lilypads down the river for Franky to jump on.

const river = new Observable(observer => {
    observer.next('lily_pad');
    // Enter your code here

    observer.complete();
});

river.subscribe(console.log);
