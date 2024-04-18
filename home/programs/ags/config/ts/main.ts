const scss = App.configDir + "/main.scss";
const css = App.configDir + "/style.css";

const time = Variable("", {
  poll: [
    1000,
    function () {
      return Date().toString();
    }
  ]
});

Utils.monitorFile(
  `${App.configDir}/style`,

  function () {
    const scss = `${App.configDir}/style.scss`;

    const css = `./style.css`;

    Utils.exec(`sass ${scss} ${css}`);
    App.resetCss();
    App.applyCss(css);
  }
);

const Bar = (monitor: number) =>
  Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      start_widget: Widget.Label({
        hpack: "center",
        label: "Welcome to AGS!"
      }),
      end_widget: Widget.Label({
        hpack: "center",
        label: time.bind()
      })
    })
  });

App.config({
  style: css,
  windows: [Bar(2)]
});
