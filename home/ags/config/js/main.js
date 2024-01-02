import { Widget } from '../import.js';
import { Time } from './widgets/time.js'

const Start = () => Widget.Box({
    hpack: "start",
    children: []
})
const Center = () => Widget.Box({
    children: []
})
const End = () => Widget.Box({
    hpack: "end",
    children: [
        Time()
    ]
})

const Bar = (monitor) => Widget.Window({
    monitor,
    name: `bar-${monitor}`,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        startWidget: Start(),
        centerWidget: Center(),
        endWidget: End(),
    }),
})

export {
    Bar
}