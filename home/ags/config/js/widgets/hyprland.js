import { Hyprland, Widget } from "../../import.js";

const Workspaces = () =>
  Widget.Box({
    class_name: "workspaces",
    children: Hyprland.bind("workspaces").transform((ws) => {
      return ws.map(({ id }) =>
        Widget.Button({
          on_clicked: () => Hyprland.sendMessage(`dispatch workspace ${id}`),
          child: Widget.Label(`${id}`),
          class_name: Hyprland.active.workspace.bind("id")
            .transform((i) => `${i === id ? "focused" : ""}`),
        })
      );
    }),
  });

export { Workspaces };
