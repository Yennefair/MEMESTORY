import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  refresh = () => {
    fetch('/memes', { headers: { accept: "application/json" }})
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
