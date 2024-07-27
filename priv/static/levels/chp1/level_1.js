
import { Observable } from 'rxjs';

const river = new Observable(observer => {
    observer.next('lily_pad');
    observer.complete();
});

// TODO: Subscribe to the river and log the items.
