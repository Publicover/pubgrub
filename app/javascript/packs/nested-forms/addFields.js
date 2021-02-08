// doing it this way becuase i don't want to add the cocoon gem to the asset pipeline
// taken from https://github.com/stevepolitodesign/rails-nested-form-example

class addFields {
  constructor() {
    this.links = document.querySelectorAll(".add_fields");
    this.iterateLinks();
  }

  iterateLinks() {
    if (this.links.length === 0) return;
    this.links.forEach((link) => {
      link.addEventListener("click", (e) => {
        this.handleClick(link, e);
      });
    });
  }

  handleClick(link, e) {
    if (!link || !e) return;
    e.preventDefault();
    let time = new Date().getTime();
    let linkId = link.dataset.id;
    let regexp = linkId ? new RegExp(linkId, "g") : null;
    let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null;
    newFields ? link.insertAdjacentHTML("beforebegin", newFields) : null;
  }
}

window.addEventListener("turbolinks:load", () => new addFields());
