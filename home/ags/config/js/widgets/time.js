import { Widget, Utils } from '../../import.js';


const Time = () => Widget.EventBox({
    child: Widget.Label({
        className: "date"
    }).poll(
        1000,
        (self) =>
            Utils.execAsync(["date", "+%a %b %d  %H:%M"]).then((time) =>
                self.label = time
            ),
    ),
});

export {
    Time
}