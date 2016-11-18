module ApplicationHelper
  def flash_helper(type)
    case type
    when 'notice'
      'alert alert-success'
    when 'alert'
      'alert alert-danger'
    end
  end
end
