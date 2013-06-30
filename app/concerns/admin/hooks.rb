module Admin::Hooks
  def self.included(controller)
    controller.instance_eval do
      include WhitelabelDetection
      before_filter :switch_label
    end
  end
end
