import {JSDOM} from "jsdom";

const mockDom = (domText) => {
  const dom = new JSDOM(domText);
  const $ = require('jquery')(dom.window)
  global.jQuery = $;
  global.$ = $;
}

export {mockDom}
