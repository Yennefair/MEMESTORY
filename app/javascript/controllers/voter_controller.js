import { Controller } from "stimulus";

export default class extends Controller {
  static target = ["count"]

  refresh() {
    console.log(this.countTarget);
  }
}
