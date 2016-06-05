class EmailsController < ApplicationController

  def show #post route, redirects to analysis show page
    # post route to grab all emails from user and save in database
    get_emails = Gmail.new(current_user)
    get_emails.individual_messages_ids
    # @emails = Email.where(user_id: current_user.id)
    analysis = Analysis.create(content_source: 'gmail')
    redirect_to analysis_path(analysis.id)
  end

end
