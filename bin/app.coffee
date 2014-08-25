root = exports ? this
class root.ViewWithPassViewModel
  constructor: ->
    # @password = ko.observable ''
    # ko.computed =>
    #   simg = new ScrambledImage043 "/assets/image6A.png",
    #     seed: @password()
    #     height: 16
    #     width: 12
    #     canvasId: 'view_with_pass'
    #   simg.fix()
    #   simg.paint()
    @firstName = "Bert"
    @lastName = "Bertington"

ko.applyBindings new ViewWithPassViewModel