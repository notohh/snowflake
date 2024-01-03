import { Widget } from '../import.js';
import { Time } from './widgets/time.js'
import { nixosLogo } from './widgets/images/image.js';
import { Media } from './widgets/music.js';
import { Workspaces } from './widgets/hyprland.js';

const Start = () => Widget.Box({
    hpack: "start",
    children: [
        nixosLogo(),
        Workspaces(),
    ]
});
const Center = () => Widget.Box({
    children: [
        Media(),
    ]
});
const End = () => Widget.Box({
    hpack: "end",
    children: [
        Time(),
    ]
});

const Bar = (monitor) => Widget.Window({
    monitor,
    name: `bar`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        startWidget: Start(),
        centerWidget: Center(),
        endWidget: End(),
    }),
});

export {
    Bar
}
