class HomeController < ApplicationController
  expose(:current_event) { Event.current.first }
  expose(:events) { Event.latest }
  expose(:people) { User.peers }
  expose(:topics_undone) { [] } # TODO
  expose(:topics_done) { [] }
  expose(:organizers) { User.organizers }
  expose(:locations)

  def labels
    render layout: "labels"
  end
end
