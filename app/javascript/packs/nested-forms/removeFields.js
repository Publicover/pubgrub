// doing it this way becuase i don't want to add the cocoon gem to the asset pipeline
// taken from https://github.com/stevepolitodesign/rails-nested-form-example

class removeFields {
  constructor() {
    this.iterateLinks();
  }

  iterateLinks() {
    document.addEventListener("click", (e) => {
      if (e.target && e.target.className == "remove_fields") {
        this.handleClick(e.target, e);
      }
    });
  }

  handleClick(link, e) {
    if (!link || !e) return;
    e.preventDefault();
    let fieldParent = link.closest(".nested-fields");
    let deleteField = fieldParent
      ? fieldParent.querySelector('input[type="hidden"]')
      : null;
    if (deleteField) {
      deleteField.value = 1;
      fieldParent.style.display = "none";
    }
  }
}

window.addEventListener("turbolinks:load", () => new removeFields());
