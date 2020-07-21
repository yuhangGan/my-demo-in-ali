import getElementById from "rax-get-element-by-id";
import { render, createElement } from "rax";

import Loading from "./loading";

export function loading(content) {
  getElementById("loading")
    ? (getElementById("loading").style.display = "")
    : render(<Loading content={content} />);
}

export function hideLoading() {
  getElementById("loading").style.display = "none";
}
