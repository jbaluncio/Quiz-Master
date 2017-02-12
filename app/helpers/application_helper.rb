module ApplicationHelper
	def error_messages_for(object)
		#render(:partial => 'application/error_messages', :locals => {:object => object})	
		if object && object.errors.size > 0
			messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
		    html = <<-HTML
		    <div class="alert alert-error alert-danger"> <button type="button"
		    class="close" data-dismiss="alert">×</button>
		      #{messages}
		    </div>
		    HTML

		    html.html_safe
		end
	end

end
