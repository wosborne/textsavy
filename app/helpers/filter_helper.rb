module FilterHelper
  def filter_active?(filter, value)
    return unless params[:filter]

    "is-selected is-info" if params[:filter][filter] == value
  end
end
