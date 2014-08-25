(function() {
  var root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.ViewWithPassViewModel = (function() {
    function ViewWithPassViewModel() {
      this.firstName = "Bert";
      this.lastName = "Bertington";
    }

    return ViewWithPassViewModel;

  })();

  ko.applyBindings(new ViewWithPassViewModel);

}).call(this);
