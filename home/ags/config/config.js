import { App, Utils } from "./import.js";
import { Bar } from "./js/main.js";

const scss = App.configDir + "/main.scss";
const css = App.configDir + "/style.css";

Utils.exec(`sass ${scss} ${css}`);

function reloadCss() {
    console.log("scss updating");
    Utils.exec(`sass ${scss} ${css}`);
    App.resetCss();
    App.applyCss(css);
}

Utils.monitorFile(`${App.configDir}/scss`, reloadCss, "directory");

export default {
    style: css,
    windows: [
        Bar(2),
    ],
};